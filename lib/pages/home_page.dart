import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../flavors.dart';
import '../routes/router.gr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            ? WebVersionWidget(current: current)
            : MobileVersionWidget(current: current),
      ),
    );
  }

  bool isLandscape(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var _isLandscape = _size.width > _size.height;
    return _isLandscape;
  }
}

class WebVersionWidget extends StatelessWidget {
  const WebVersionWidget({
    Key? key,
    required this.current,
  }) : super(key: key);

  final Widget current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuWidget(),
        TitleWidget(),
        Expanded(
            flex: 5,
            child: AnimatedSwitcher(
              child: current,
              duration: Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final offsetAnimation = Tween(
                  begin: 0.25,
                  end: 0.0,
                ).animate(animation);
                return RotationTransition(turns: offsetAnimation, child: child);
              },
              layoutBuilder:
                  (Widget? currentChild, List<Widget> previousChildren) {
                return currentChild != null
                    ? currentChild
                    : previousChildren.last;
              },
            )),
      ],
    );
  }
}

class MobileVersionWidget extends StatelessWidget {
  const MobileVersionWidget({
    Key? key,
    required this.current,
  }) : super(key: key);

  final Widget current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuWidget(),
        TitleWidget(),
        Expanded(
            flex: 5,
            child: AnimatedSwitcher(
              child: current,
              duration: Duration(milliseconds: 300),
            )),
      ],
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HistoryButtonWidget(),
        LogOutButtonWidget(),
      ],
    );
  }
}

class HistoryButtonWidget extends StatelessWidget {
  const HistoryButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await FirebaseAnalytics.instance.logEvent(
            name: "history",
          );

          context.router.push(HistoryRoute());
        },
        icon: Icon(Icons.history_edu));
  }
}

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          context.router.push(LoginRoute());
        },
        icon: Icon(Icons.logout));
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FittedBox(fit: BoxFit.fitWidth, child: Text("Choose wisely")));
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
        DoorWidget(doorTag: '1'),
        DoorWidget(doorTag: '2'),
        DoorWidget(doorTag: '3'),
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
        DoorWidget(doorTag: '1'),
        DoorWidget(doorTag: '2'),
        DoorWidget(doorTag: '3'),
      ],
    );
  }
}

class DoorWidget extends StatelessWidget {
  const DoorWidget({
    Key? key,
    required this.doorTag,
  }) : super(key: key);
  final String doorTag;

  @override
  Widget build(BuildContext context) {
    String _doorAssetString = F.door;

    return Expanded(
      child: FittedBox(
        child: TextButton(
          child: Image.asset(
            _doorAssetString,
          ),
          onPressed: () async {
            await FirebaseAnalytics.instance.logEvent(
              name: "door " + doorTag,
            );

            context.router.push(RollRoute());
          },
        ),
      ),
    );
  }
}
