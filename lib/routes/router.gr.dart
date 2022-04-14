// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/history_page.dart' as _i4;
import '../pages/home_page.dart' as _i1;
import '../pages/result_page.dart' as _i3;
import '../pages/roll_page.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>(
          orElse: () => const MyHomeRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MyHomePage(key: args.key));
    },
    RollRoute.name: (routeData) {
      final args =
          routeData.argsAs<RollRouteArgs>(orElse: () => const RollRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.RollPage(key: args.key));
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>(
          orElse: () => const ResultRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ResultPage(key: args.key));
    },
    HistoryRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryRouteArgs>(
          orElse: () => const HistoryRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.HistoryPage(key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(MyHomeRoute.name, path: '/'),
        _i5.RouteConfig(RollRoute.name, path: '/roll-page'),
        _i5.RouteConfig(ResultRoute.name, path: '/result-page'),
        _i5.RouteConfig(HistoryRoute.name, path: '/history-page')
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i5.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({_i6.Key? key})
      : super(MyHomeRoute.name, path: '/', args: MyHomeRouteArgs(key: key));

  static const String name = 'MyHomeRoute';
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.RollPage]
class RollRoute extends _i5.PageRouteInfo<RollRouteArgs> {
  RollRoute({_i6.Key? key})
      : super(RollRoute.name,
            path: '/roll-page', args: RollRouteArgs(key: key));

  static const String name = 'RollRoute';
}

class RollRouteArgs {
  const RollRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'RollRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ResultPage]
class ResultRoute extends _i5.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({_i6.Key? key})
      : super(ResultRoute.name,
            path: '/result-page', args: ResultRouteArgs(key: key));

  static const String name = 'ResultRoute';
}

class ResultRouteArgs {
  const ResultRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HistoryPage]
class HistoryRoute extends _i5.PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({_i6.Key? key})
      : super(HistoryRoute.name,
            path: '/history-page', args: HistoryRouteArgs(key: key));

  static const String name = 'HistoryRoute';
}

class HistoryRouteArgs {
  const HistoryRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key}';
  }
}
