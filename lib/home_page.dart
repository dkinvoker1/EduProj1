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
      body: Center(
        child: Column(
          children: [
            Container(
                width: 600.0,
                height: 200.0,
                child: FittedBox(
                    fit: BoxFit.contain, child: Text("Choose wisely"))),
            Row(
              children: <Widget>[
                DoorWidget(),
                DoorWidget(),
                DoorWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DoorWidget extends StatelessWidget {
  const DoorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextButton(
        child: Image.asset('door.jpg'),
        onPressed: () {
          context.router.push(RollRoute());
        },
      ),
      flex: 1,
    );
  }
}
