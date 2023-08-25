import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:pokedex_challenge/src/core/domain/repositories/favorite_repositoryl.dart';
import 'package:pokedex_challenge/src/core/domain/repositories/i_favorite_repository.dart';
import 'package:pokedex_challenge/src/core/helpers/routes.dart';
import 'package:pokedex_challenge/src/core/interfaces/htpp/http_dio.dart';
import 'package:pokedex_challenge/src/core/interfaces/htpp/i_http.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/i_local_storage.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/local_storage.dart';
import 'package:pokedex_challenge/src/core/log/log.dart';
import 'package:pokedex_challenge/src/modules/favorites/aplication/use_cases/get_favorites_usecase.dart';
import 'package:pokedex_challenge/src/modules/favorites/aplication/use_cases/insert_favorite_usecase.dart';
import 'package:pokedex_challenge/src/modules/favorites/aplication/use_cases/remove_favorite_usecase.dart';
import 'package:pokedex_challenge/src/modules/favorites/favorite_module.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/update_evolutions_pokemon_usecase.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/update_move_pokemon_usecase.dart';
import 'package:pokedex_challenge/src/modules/info/aplication/info_controller.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/home_controller.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/get_dialog_description_view_model_usecase.dart';
import 'package:pokedex_challenge/src/core/domain/repositories/i_pokemons_repository.dart';
import 'package:pokedex_challenge/src/core/domain/repositories/pokemons_repository.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/get_card_pockemons_view_models_usecase.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/get_pokemon_list_result_model_usecase.dart';
import 'package:pokedex_challenge/src/modules/home/ui/home_page.dart';

import 'modules/favorites/aplication/favorite_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Log(printer: PrettyPrinter())), //Log
        Bind.singleton((i) => HttpDio()), // Dio
        Bind.singleton((i) => LocalStorage(logger: i.get())),
        Bind.singleton((i) => PokemonsRepository(http: i.get(), localStorage: i.get())),
        Bind.lazySingleton((i) => FavoriteRepository(i.get())),
        Bind.lazySingleton((i) => InsertFavoriteUsecase(i.get())),
        Bind.lazySingleton((i) => GetCardPockemonViewModelUsecase(pokemonsRepository: i.get())),
        Bind.lazySingleton((i) => GetPokemonListResultModelUsecase(pokemonsRepository: i.get())),
        Bind.lazySingleton((i) => GetFavoritesUsecase(i.get())),
        Bind.lazySingleton((i) => RemoveFavoriteUsecase(i.get())),
        Bind.lazySingleton((i) => UpdateMovePokemonUsecase(pokemonsRepository: i.get())),
        Bind.lazySingleton((i) => UpdateEvolutionsPokemonUsecase(pokemonsRepository: i.get())),
        Bind.lazySingleton((i) => GetDialogDescriptionViewModelUsecase(pokemonsRepository: i.get())),
        Bind.lazySingleton((i) => HomeController(i.get(), i.get(), i.get())),
        Bind.lazySingleton((i) => InfoController(i.get(), i.get())),
        Bind.lazySingleton((i) => FavoriteController(i.get(), i.get(), i.get(), i.get(), i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Routes.home.childRoute, child: (context, args) => const HomePage()),
        ModuleRoute(Routes.favorites.moduleRoute, module: FavoriteModule()),
      ];
}
