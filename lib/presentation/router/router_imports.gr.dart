// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:ecommerce_flutter_bloc/data/models/models.dart' as _i9;
import 'package:ecommerce_flutter_bloc/presentation/screens/checkout/checkout_imports.dart'
    as _i5;
import 'package:ecommerce_flutter_bloc/presentation/screens/home/category/category_imports.dart'
    as _i3;
import 'package:ecommerce_flutter_bloc/presentation/screens/home/product/product_imports.dart'
    as _i4;
import 'package:ecommerce_flutter_bloc/presentation/screens/main_screen.dart'
    as _i2;
import 'package:ecommerce_flutter_bloc/presentation/screens/orders/orders_imports.dart'
    as _i6;
import 'package:ecommerce_flutter_bloc/presentation/screens/splash/splash_imports.dart'
    as _i1;
import 'package:flutter/material.dart' as _i8;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    MainScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MainView());
    },
    CategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryScreenRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.CategoryScreen(key: args.key, category: args.category));
    },
    ProductScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProductScreenRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.ProductScreen(key: args.key, products: args.products));
    },
    CheckoutScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutScreenRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i5.CheckoutScreen(key: args.key, totalPrice: args.totalPrice));
    },
    OrdersScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.OrdersScreen());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i7.RouteConfig(MainScreenRoute.name, path: '/main-screen'),
        _i7.RouteConfig(CategoryScreenRoute.name, path: '/category-screen'),
        _i7.RouteConfig(ProductScreenRoute.name, path: '/product-screen'),
        _i7.RouteConfig(CheckoutScreenRoute.name, path: '/checkout-screen'),
        _i7.RouteConfig(OrdersScreenRoute.name, path: '/orders-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.MainScreen]
class MainScreenRoute extends _i7.PageRouteInfo<void> {
  const MainScreenRoute() : super(MainScreenRoute.name, path: '/main-screen');

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i3.CategoryScreen]
class CategoryScreenRoute extends _i7.PageRouteInfo<CategoryScreenRouteArgs> {
  CategoryScreenRoute({_i8.Key? key, required _i9.Category category})
      : super(CategoryScreenRoute.name,
            path: '/category-screen',
            args: CategoryScreenRouteArgs(key: key, category: category));

  static const String name = 'CategoryScreenRoute';
}

class CategoryScreenRouteArgs {
  const CategoryScreenRouteArgs({this.key, required this.category});

  final _i8.Key? key;

  final _i9.Category category;

  @override
  String toString() {
    return 'CategoryScreenRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i4.ProductScreen]
class ProductScreenRoute extends _i7.PageRouteInfo<ProductScreenRouteArgs> {
  ProductScreenRoute({_i8.Key? key, required _i9.Product products})
      : super(ProductScreenRoute.name,
            path: '/product-screen',
            args: ProductScreenRouteArgs(key: key, products: products));

  static const String name = 'ProductScreenRoute';
}

class ProductScreenRouteArgs {
  const ProductScreenRouteArgs({this.key, required this.products});

  final _i8.Key? key;

  final _i9.Product products;

  @override
  String toString() {
    return 'ProductScreenRouteArgs{key: $key, products: $products}';
  }
}

/// generated route for
/// [_i5.CheckoutScreen]
class CheckoutScreenRoute extends _i7.PageRouteInfo<CheckoutScreenRouteArgs> {
  CheckoutScreenRoute({_i8.Key? key, required double totalPrice})
      : super(CheckoutScreenRoute.name,
            path: '/checkout-screen',
            args: CheckoutScreenRouteArgs(key: key, totalPrice: totalPrice));

  static const String name = 'CheckoutScreenRoute';
}

class CheckoutScreenRouteArgs {
  const CheckoutScreenRouteArgs({this.key, required this.totalPrice});

  final _i8.Key? key;

  final double totalPrice;

  @override
  String toString() {
    return 'CheckoutScreenRouteArgs{key: $key, totalPrice: $totalPrice}';
  }
}

/// generated route for
/// [_i6.OrdersScreen]
class OrdersScreenRoute extends _i7.PageRouteInfo<void> {
  const OrdersScreenRoute()
      : super(OrdersScreenRoute.name, path: '/orders-screen');

  static const String name = 'OrdersScreenRoute';
}
