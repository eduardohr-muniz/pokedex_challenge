import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/local_storage.dart';
import './src/app_module.dart';
import './src/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.initHive();
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
