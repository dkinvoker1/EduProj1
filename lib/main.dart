import 'package:flutter/material.dart';

import 'routes/router.gr.dart';

void main() {
  runApp(App());
}
    
class App extends StatelessWidget {
     
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    );
  }
}
