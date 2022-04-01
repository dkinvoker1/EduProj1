import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../flavors.dart';
import '../routes/router.gr.dart';

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
            Expanded(
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                     child: Text("Choose wisely"))),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DoorWidget(),
                  DoorWidget(),
                  DoorWidget(),
                ],
              ),
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
    String _doorAssetString = F.door;

    return Expanded(
      child: FittedBox(
        child: TextButton(
          child: Image.asset(
            _doorAssetString,
          ),
          onPressed: () {
            context.router.push(RollRoute());
          },
        ),
      ),
    );
  }
}
