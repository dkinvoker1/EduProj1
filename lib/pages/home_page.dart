import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../flavors.dart';
import '../routes/router.gr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget current = DoorRowWidget();

  @override
  Widget build(BuildContext context) {
    if (isLandscape(context)) {
      setState(() {
        current = DoorRowWidget();
      });
    } else if (!isLandscape(context)) {
      setState(() {
        current = DoorColumnWidget();
      });
    }

    return Scaffold(
      body: Center(
        child: kIsWeb
            ? Column(
                children: [
                  Expanded(
                      child: FittedBox(
                          fit: BoxFit.fitWidth, child: Text("Choose wisely"))),
                  Expanded(
                      flex: 5,
                      child: AnimatedSwitcher(
                        child: current,
                        duration: Duration(milliseconds: 400),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          final offsetAnimation = Tween(
                            begin: 0.25,
                            end: 0.0,
                          ).animate(animation);
                          return RotationTransition(
                              turns: offsetAnimation, child: child);
                        },
                        layoutBuilder: (Widget? currentChild,
                            List<Widget> previousChildren) {
                          return currentChild != null
                              ? currentChild
                              : previousChildren.last;
                        },
                      )),
                ],
              )
            : Column(
                children: [
                  Expanded(
                      child: FittedBox(
                          fit: BoxFit.fitWidth, child: Text("Choose wisely"))),
                  Expanded(
                      flex: 5,
                      child: AnimatedSwitcher(
                        child: current,
                        duration: Duration(milliseconds: 300),
                      )),
                ],
              ),
      ),
    );
  }

  bool isLandscape(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var _isLandscape = _size.width > _size.height;
    return _isLandscape;
  }
}

class DoorRowWidget extends StatelessWidget {
  const DoorRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DoorWidget(),
        DoorWidget(),
        DoorWidget(),
      ],
    );
  }
}

class DoorColumnWidget extends StatelessWidget {
  const DoorColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DoorWidget(),
        DoorWidget(),
        DoorWidget(),
      ],
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
