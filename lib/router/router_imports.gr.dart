// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:ecommerce_flutter_bloc/data/models/models.dart' as _i6;
import 'package:ecommerce_flutter_bloc/presentation/screens/home/category/category_imports.dart'
    as _i2;
import 'package:ecommerce_flutter_bloc/presentation/screens/home/product/product_imports.dart'
    as _i3;
import 'package:ecommerce_flutter_bloc/presentation/screens/main_screen.dart'
    as _i1;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MainScreen());
    },
    CategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryScreenRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.CategoryScreen(key: args.key, category: args.category));
    },
    ProductScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProductScreenRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.ProductScreen(key: args.key, products: args.products));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MainScreenRoute.name, path: '/'),
        _i4.RouteConfig(CategoryScreenRoute.name, path: '/category-screen'),
        _i4.RouteConfig(ProductScreenRoute.name, path: '/product-screen')
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainScreenRoute extends _i4.PageRouteInfo<void> {
  const MainScreenRoute() : super(MainScreenRoute.name, path: '/');

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i2.CategoryScreen]
class CategoryScreenRoute extends _i4.PageRouteInfo<CategoryScreenRouteArgs> {
  CategoryScreenRoute({_i5.Key? key, required _i6.Category category})
      : super(CategoryScreenRoute.name,
            path: '/category-screen',
            args: CategoryScreenRouteArgs(key: key, category: category));

  static const String name = 'CategoryScreenRoute';
}

class CategoryScreenRouteArgs {
  const CategoryScreenRouteArgs({this.key, required this.category});

  final _i5.Key? key;

  final _i6.Category category;

  @override
  String toString() {
    return 'CategoryScreenRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i3.ProductScreen]
class ProductScreenRoute extends _i4.PageRouteInfo<ProductScreenRouteArgs> {
  ProductScreenRoute({_i5.Key? key, required _i6.Product products})
      : super(ProductScreenRoute.name,
            path: '/product-screen',
            args: ProductScreenRouteArgs(key: key, products: products));

  static const String name = 'ProductScreenRoute';
}

class ProductScreenRouteArgs {
  const ProductScreenRouteArgs({this.key, required this.products});

  final _i5.Key? key;

  final _i6.Product products;

  @override
  String toString() {
    return 'ProductScreenRouteArgs{key: $key, products: $products}';
  }
}
