class Routes {
  //home
  static RouteEntity favorites = RouteEntity(route: "/favorites/", moduleRoute: "/favorites/", childRoute: "/");
  static RouteEntity home = RouteEntity(route: "/", moduleRoute: "/", childRoute: "/");
}

class RouteEntity {
  String route;
  String moduleRoute;
  String childRoute;
  RouteEntity({
    required this.route,
    required this.moduleRoute,
    required this.childRoute,
  });
}
