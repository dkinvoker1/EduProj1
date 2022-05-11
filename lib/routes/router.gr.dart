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
import 'package:flutter/foundation.dart' as _i9;
import 'package:flutter/material.dart' as _i7;

import '../pages/history_page.dart' as _i5;
import '../pages/home_page.dart' as _i2;
import '../pages/login.dart' as _i1;
import '../pages/result_page.dart' as _i4;
import '../pages/roll_page.dart' as _i3;
import 'authGuard.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter(
      {_i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage());
    },
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>(
          orElse: () => const MyHomeRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.MyHomePage(key: args.key));
    },
    RollRoute.name: (routeData) {
      final args =
          routeData.argsAs<RollRouteArgs>(orElse: () => const RollRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RollPage(key: args.key));
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>(
          orElse: () => const ResultRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.ResultPage(key: args.key));
    },
    HistoryRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.HistoryPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginRoute.name, path: '/'),
        _i6.RouteConfig(MyHomeRoute.name,
            path: '/my-home-page', guards: [authGuard]),
        _i6.RouteConfig(RollRoute.name,
            path: '/roll-page', guards: [authGuard]),
        _i6.RouteConfig(ResultRoute.name,
            path: '/result-page', guards: [authGuard]),
        _i6.RouteConfig(HistoryRoute.name,
            path: '/history-page', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i6.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({_i9.Key? key})
      : super(MyHomeRoute.name,
            path: '/my-home-page', args: MyHomeRouteArgs(key: key));

  static const String name = 'MyHomeRoute';
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RollPage]
class RollRoute extends _i6.PageRouteInfo<RollRouteArgs> {
  RollRoute({_i9.Key? key})
      : super(RollRoute.name,
            path: '/roll-page', args: RollRouteArgs(key: key));

  static const String name = 'RollRoute';
}

class RollRouteArgs {
  const RollRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RollRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ResultPage]
class ResultRoute extends _i6.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({_i9.Key? key})
      : super(ResultRoute.name,
            path: '/result-page', args: ResultRouteArgs(key: key));

  static const String name = 'ResultRoute';
}

class ResultRouteArgs {
  const ResultRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HistoryPage]
class HistoryRoute extends _i6.PageRouteInfo<void> {
  const HistoryRoute() : super(HistoryRoute.name, path: '/history-page');

  static const String name = 'HistoryRoute';
}
