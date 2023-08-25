import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/helpers/routes.dart';
import 'package:pokedex_challenge/src/modules/favorites/ui/favorites_page.dart';

class FavoriteModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [ChildRoute(Routes.favorites.childRoute, child: (context, args) => const FavoritesPage())];
}
