import "package:auto_route/auto_route.dart";

import "../pages/index.dart";
import "../pages/home/home_view.dart";
import '../pages/user/user_view.dart';

part 'routers.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IndexRoute.page, path: "/", children: [
          AutoRoute(page: HomeRoute.page, path: ""),
          AutoRoute(page: UserRoute.page, path: "user")
        ]),
      ];
}
