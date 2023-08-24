import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:pokedex_challenge/src/core/interfaces/htpp/http_dio.dart';
import 'package:pokedex_challenge/src/core/interfaces/htpp/i_http.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/i_local_storage.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/local_storage.dart';
import 'package:pokedex_challenge/src/core/log/log.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/home_controller.dart';
import 'package:pokedex_challenge/src/modules/home/domain/repositories/i_pokemons_repository.dart';
import 'package:pokedex_challenge/src/modules/home/domain/repositories/pokemons_repository.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/get_card_pockemons_view_models_usecase.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/get_pokemon_list_result_model_usecase.dart';
import 'package:pokedex_challenge/src/modules/home/ui/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<IHttp>((i) => HttpDio()),
        Bind.singleton((i) => Log(printer: PrettyPrinter())),
        Bind.singleton<ILocalStorage>((i) => LocalStorage(logger: i.get())),
        Bind.singleton<IPokemonsRepository>((i) => PokemonsRepository(http: i.get(), localStorage: i.get())),
        Bind.singleton<GetCardPockemonViewModelUsecase>((i) => GetCardPockemonViewModelUsecase(pokemonsRepository: i.get())),
        Bind.singleton<GetPokemonListResultModelUsecase>((i) => GetPokemonListResultModelUsecase(pokemonsRepository: i.get())),
        Bind.singleton<HomeController>((i) => HomeController(getPokemonListResultModelUseCase: i.get(), getCardPockemonViewModelUseCase: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
