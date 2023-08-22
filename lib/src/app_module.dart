import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/local_storage.dart';
import 'package:pokedex_challenge/src/core/log/log.dart';
import './modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Log(printer: PrettyPrinter())),
        Bind.singleton((i) => LocalStorage(logger: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
