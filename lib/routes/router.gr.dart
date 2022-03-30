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
import 'package:flutter/material.dart' as _i5;

import '../pages/home_page.dart' as _i1;
import '../pages/result_page.dart' as _i3;
import '../pages/roll_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>(
          orElse: () => const MyHomeRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MyHomePage(key: args.key));
    },
    RollRoute.name: (routeData) {
      final args =
          routeData.argsAs<RollRouteArgs>(orElse: () => const RollRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.RollPage(key: args.key));
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>(
          orElse: () => const ResultRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ResultPage(key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MyHomeRoute.name, path: '/'),
        _i4.RouteConfig(RollRoute.name, path: '/roll-page'),
        _i4.RouteConfig(ResultRoute.name, path: '/result-page')
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({_i5.Key? key})
      : super(MyHomeRoute.name, path: '/', args: MyHomeRouteArgs(key: key));

  static const String name = 'MyHomeRoute';
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.RollPage]
class RollRoute extends _i4.PageRouteInfo<RollRouteArgs> {
  RollRoute({_i5.Key? key})
      : super(RollRoute.name,
            path: '/roll-page', args: RollRouteArgs(key: key));

  static const String name = 'RollRoute';
}

class RollRouteArgs {
  const RollRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'RollRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ResultPage]
class ResultRoute extends _i4.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({_i5.Key? key})
      : super(ResultRoute.name,
            path: '/result-page', args: ResultRouteArgs(key: key));

  static const String name = 'ResultRoute';
}

class ResultRouteArgs {
  const ResultRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key}';
  }
}
