// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:ecommerce_flutter_bloc/data/models/models.dart' as _i5;
import 'package:ecommerce_flutter_bloc/presentation/screens/home/category/category_imports.dart'
    as _i2;
import 'package:ecommerce_flutter_bloc/presentation/screens/main_screen.dart'
    as _i1;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MainScreen());
    },
    CategoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryScreenRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.CategoryScreen(key: args.key, category: args.category));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MainScreenRoute.name, path: '/'),
        _i3.RouteConfig(CategoryScreenRoute.name, path: '/category-screen')
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainScreenRoute extends _i3.PageRouteInfo<void> {
  const MainScreenRoute() : super(MainScreenRoute.name, path: '/');

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i2.CategoryScreen]
class CategoryScreenRoute extends _i3.PageRouteInfo<CategoryScreenRouteArgs> {
  CategoryScreenRoute({_i4.Key? key, required _i5.Category category})
      : super(CategoryScreenRoute.name,
            path: '/category-screen',
            args: CategoryScreenRouteArgs(key: key, category: category));

  static const String name = 'CategoryScreenRoute';
}

class CategoryScreenRouteArgs {
  const CategoryScreenRouteArgs({this.key, required this.category});

  final _i4.Key? key;

  final _i5.Category category;

  @override
  String toString() {
    return 'CategoryScreenRouteArgs{key: $key, category: $category}';
  }
}
