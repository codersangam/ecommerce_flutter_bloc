// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:ecommerce_flutter_bloc/data/models/models.dart' as _i8;
import 'package:ecommerce_flutter_bloc/presentation/screens/checkout/checkout_imports.dart'
    as _i5;
import 'package:ecommerce_flutter_bloc/presentation/screens/home/category/category_imports.dart'
    as _i3;
import 'package:ecommerce_flutter_bloc/presentation/screens/home/product/product_imports.dart'
    as _i4;
import 'package:ecommerce_flutter_bloc/presentation/screens/main_screen.dart'
    as _i2;
import 'package:ecommerce_flutter_bloc/presentation/screens/splash/splash_imports.dart'
    as _i1;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    MainScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MainScreen());
    },
    CategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryScreenRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.CategoryScreen(key: args.key, category: args.category));
    },
    ProductScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProductScreenRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.ProductScreen(key: args.key, products: args.products));
    },
    CheckoutScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.CheckoutScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i6.RouteConfig(MainScreenRoute.name, path: '/main-screen'),
        _i6.RouteConfig(CategoryScreenRoute.name, path: '/category-screen'),
        _i6.RouteConfig(ProductScreenRoute.name, path: '/product-screen'),
        _i6.RouteConfig(CheckoutScreenRoute.name, path: '/checkout-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.MainScreen]
class MainScreenRoute extends _i6.PageRouteInfo<void> {
  const MainScreenRoute() : super(MainScreenRoute.name, path: '/main-screen');

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i3.CategoryScreen]
class CategoryScreenRoute extends _i6.PageRouteInfo<CategoryScreenRouteArgs> {
  CategoryScreenRoute({_i7.Key? key, required _i8.Category category})
      : super(CategoryScreenRoute.name,
            path: '/category-screen',
            args: CategoryScreenRouteArgs(key: key, category: category));

  static const String name = 'CategoryScreenRoute';
}

class CategoryScreenRouteArgs {
  const CategoryScreenRouteArgs({this.key, required this.category});

  final _i7.Key? key;

  final _i8.Category category;

  @override
  String toString() {
    return 'CategoryScreenRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i4.ProductScreen]
class ProductScreenRoute extends _i6.PageRouteInfo<ProductScreenRouteArgs> {
  ProductScreenRoute({_i7.Key? key, required _i8.Product products})
      : super(ProductScreenRoute.name,
            path: '/product-screen',
            args: ProductScreenRouteArgs(key: key, products: products));

  static const String name = 'ProductScreenRoute';
}

class ProductScreenRouteArgs {
  const ProductScreenRouteArgs({this.key, required this.products});

  final _i7.Key? key;

  final _i8.Product products;

  @override
  String toString() {
    return 'ProductScreenRouteArgs{key: $key, products: $products}';
  }
}

/// generated route for
/// [_i5.CheckoutScreen]
class CheckoutScreenRoute extends _i6.PageRouteInfo<void> {
  const CheckoutScreenRoute()
      : super(CheckoutScreenRoute.name, path: '/checkout-screen');

  static const String name = 'CheckoutScreenRoute';
}
