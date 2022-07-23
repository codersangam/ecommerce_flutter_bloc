part of 'router_imports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: SplashScreen, initial: true),
    AdaptiveRoute(page: MainScreen),
    AdaptiveRoute(page: CategoryScreen),
    AdaptiveRoute(page: ProductScreen),
    AdaptiveRoute(page: CheckoutScreen),
  ],
)
class $AppRouter {}
