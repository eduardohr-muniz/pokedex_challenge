import 'dart:io';
// ignore: unused_import
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/ability_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/move_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/stat_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/type_model.dart';
import '../../log/log.dart';
import 'i_local_storage.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage implements ILocalStorage {
  final Log logger;
  LocalStorage({required this.logger});

  static initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    Hive.registerAdapter(MoveModelAdapter());
    Hive.registerAdapter(PokemonModelAdapter());
    Hive.registerAdapter(StatModelAdapter());
    Hive.registerAdapter(TypeModelAdapter());
    Hive.registerAdapter(AbilityModelAdapter());

    // await Hive.deleteBoxFromDisk("pokemons");
    // await Hive.deleteBoxFromDisk("favorites");
    await Hive.openBox<PokemonModel>("pokemons");
    await Hive.openBox<String>("favorites");
  }

  @override
  Future<void> delete<T>(String boxId, {required String key}) async {
    var box = Hive.box<T>(boxId);
    box.delete(key);
    _logInfos(boxId, "DELETE", key: key);
  }

  @override
  Future<T?> get<T>(String boxId, {required String key}) async {
    var box = Hive.box<T>(boxId);
    final result = box.get(key);
    _logInfos(boxId, "GET", key: key, value: result);
    return result;
  }

  @override
  Future<void> put<T>(String boxId, {required String key, required T value}) async {
    var box = Hive.box<T>(boxId);
    await box.put(key, value);
    _logInfos(boxId, "PUT", key: key, value: value);
  }

  @override
  Future<List<T>>? getAll<T>(String boxId) async {
    var box = Hive.box<T>(boxId);
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
    return resultMap;
  }

  @override
  Future<bool> containsKey<T>(String boxId, {required String key}) async {
    var box = await Hive.openBox<T>(boxId);
    final bool result = box.containsKey(key);
    _logInfos(boxId, "CONTAINSKEY", key: key, value: result);
    return result;
  }

  void _logInfos(String box, String method, {String? key, dynamic value}) {
    logger.d('Method: $method \nBox:$box \nKey: $key \nvalue: $value');
  }
}
