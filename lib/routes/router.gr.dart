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
import 'package:flutter/foundation.dart' as _i8;
import 'package:flutter/material.dart' as _i7;

import '../pages/history_page.dart' as _i5;
import '../pages/home_page.dart' as _i2;
import '../pages/login.dart' as _i1;
import '../pages/result_page.dart' as _i4;
import '../pages/roll_page.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage(key: args.key));
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
      final args = routeData.argsAs<HistoryRouteArgs>(
          orElse: () => const HistoryRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.HistoryPage(key: args.key));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginRoute.name, path: '/'),
        _i6.RouteConfig(MyHomeRoute.name, path: '/my-home-page'),
        _i6.RouteConfig(RollRoute.name, path: '/roll-page'),
        _i6.RouteConfig(ResultRoute.name, path: '/result-page'),
        _i6.RouteConfig(HistoryRoute.name, path: '/history-page')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i8.Key? key})
      : super(LoginRoute.name, path: '/', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i6.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({_i8.Key? key})
      : super(MyHomeRoute.name,
            path: '/my-home-page', args: MyHomeRouteArgs(key: key));

  static const String name = 'MyHomeRoute';
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RollPage]
class RollRoute extends _i6.PageRouteInfo<RollRouteArgs> {
  RollRoute({_i8.Key? key})
      : super(RollRoute.name,
            path: '/roll-page', args: RollRouteArgs(key: key));

  static const String name = 'RollRoute';
}

class RollRouteArgs {
  const RollRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'RollRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ResultPage]
class ResultRoute extends _i6.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({_i8.Key? key})
      : super(ResultRoute.name,
            path: '/result-page', args: ResultRouteArgs(key: key));

  static const String name = 'ResultRoute';
}

class ResultRouteArgs {
  const ResultRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HistoryPage]
class HistoryRoute extends _i6.PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({_i8.Key? key})
      : super(HistoryRoute.name,
            path: '/history-page', args: HistoryRouteArgs(key: key));

  static const String name = 'HistoryRoute';
}

class HistoryRouteArgs {
  const HistoryRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key}';
  }
}
