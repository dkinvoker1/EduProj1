import 'package:edu_proj1/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    var _isHeven = FlavorConfig.instance.name == 'HevenDoor';

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: _isHeven
          ? ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.blue[200])
          : ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    );
  }
}
