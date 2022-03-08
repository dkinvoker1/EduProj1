import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'routes/router.gr.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Od farmera do milionera"),
        ),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextButton(
                child: Image.asset('door.jpg'),
                onPressed: () {
                  context.router.push(ResultRoute());
                },
              ),
              flex: 1,
            ),
            Flexible(
              child: TextButton(
                child: Image.asset('door.jpg'),
                onPressed: () {
                  context.router.push(ResultRoute());
                },
              ),
              flex: 1,
            ),
            Flexible(
              child: TextButton(
                child: Image.asset('door.jpg'),
                onPressed: () {
                  context.router.push(ResultRoute());
                },
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
