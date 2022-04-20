import 'package:edu_proj1/flavors.dart';
import 'package:edu_proj1/routes/router.gr.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    var _isHeven = F.appFlavor == Flavor.HEVEN;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: _isHeven
          ? ThemeData.light()
              .copyWith(scaffoldBackgroundColor: Colors.blue[200])
          : ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    );
  }
}
