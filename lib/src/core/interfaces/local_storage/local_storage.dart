import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/moves_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/stats_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/type_model.dart';
import '../../log/log.dart';
import 'i_local_storage.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage implements ILocalStorage {
  final Log logger;
  LocalStorage({required this.logger}) {
    print("${this.hashCode}");
  }

  static initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    Hive.registerAdapter(MovesModelAdapter());
    Hive.registerAdapter(PokemonModelAdapter());
    Hive.registerAdapter(StatsModelAdapter());
    Hive.registerAdapter(TypeModelAdapter());

    await Hive.openBox<PokemonModel>("pokemons");
  }

  @override
  Future<void> delete<T>(String boxId, {required String key}) async {
    var box = await Hive.openLazyBox<T>(boxId);
    box.delete(key);
    // box.close();
    _logInfos(boxId, "DELETE", key: key);
  }

  @override
  Future<T?> get<T>(String boxId, {required String key}) async {
    var box = Hive.box<T>(boxId);
    final result = box.get(key);
    _logInfos(boxId, "GET", key: key, value: result);
    // box.close();
    return result;
  }

  @override
  Future<void> put<T>(String boxId, {required String key, required T value}) async {
    var box = Hive.box<T>(boxId);
    await box.put(key, value);
    // box.close();
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
    // await box.close();
    return resultMap;
  }

  void _logInfos(String box, String method, {String? key, dynamic value}) {
    logger.d('Method: $method \nBox:$box \nKey: $key \nvalue: $value');
  }

  @override
  Future<bool> containsKey<T>(String boxId, {required String key}) async {
    var box = await Hive.openBox<T>(boxId);
    final bool result = box.containsKey(key);
    // box.close();
    _logInfos(boxId, "CONTAINSKEY", key: key, value: result);
    return result;
  }
}
