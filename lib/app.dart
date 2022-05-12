import 'package:edu_proj1/flavors.dart';
import 'package:edu_proj1/pages/history_page.dart';
import 'package:edu_proj1/pages/login.dart';
import 'package:edu_proj1/routes/authGuard.dart';
import 'package:edu_proj1/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    var _isHeven = F.appFlavor == Flavor.HEVEN;

    return MaterialApp.router(
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        defaultScale: false,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
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
