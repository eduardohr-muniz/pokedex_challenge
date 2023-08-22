import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../../log/log.dart';
import 'i_local_storage.dart';

class LocalStorage implements ILocalStorage {
  final Log logger;
  LocalStorage({required this.logger});

  static init() {
    final hive = LocalStorage.initHive();
    return hive;
  }

  static initHive() async {
    String path = "";
    if (kIsWeb) {
      path = "/assets/db";
    } else {
      path = Directory.current.path;
    }
    Hive.init(path);
  }

  @override
  Future<void> delete<T>(String boxId, {required String key}) async {
    var box = await Hive.openLazyBox<T>(boxId);
    box.delete(key);
    box.close();
    _logInfos(boxId, "DELETE", key: key);
  }

  @override
  Future<T?> get<T>(String boxId, {required String key}) async {
    var box = await Hive.openLazyBox<T>(boxId);
    final result = box.get(key);
    box.close();
    _logInfos(boxId, "GET", key: key, value: result);
    return result;
  }

  @override
  Future<void> put<T>(String boxId, {required String key, required T value}) async {
    var box = await Hive.openLazyBox<T>(boxId);
    await box.put(key, value);
    box.close();
    _logInfos(boxId, "PUT", key: key, value: value);
  }

  @override
  Future<List<T>>? getAll<T>(String boxId) async {
    var box = await Hive.openBox<T>(boxId);
    List<T> resultMap = [];
    try {
      resultMap = List<T>.from(box.values);
    } catch (e) {
      for (var key in box.keys) {
        final content = box.get(key);
        if (content != null) {
          try {
            resultMap.add(content);
          } catch (e) {
            box.delete(key);
            _logInfos(boxId, "DELETE", key: key, value: content);
          }
        }
      }
    }
    _logInfos(boxId, "GETALL", key: box.keys.toString(), value: "${resultMap.length}");
    await box.close();
    return resultMap;
  }

  void _logInfos(String box, String method, {String? key, dynamic value}) {
    logger.d('Method: $method \nBox:$box \nKey: $key \nvalue: $value');
  }
}
