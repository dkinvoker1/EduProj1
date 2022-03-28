import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:edu_proj1/routes/router.gr.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var isSucces = Random().nextInt(100) < 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    isSucces ? AssetImage('heven.jpg') : AssetImage('hell.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: isSucces ? WinWidget() : LoseWidget(),
        ),
      ),
    );
  }
}

class WinWidget extends StatelessWidget {
  const WinWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('''Congratulations!''',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 100, color: Colors.black)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text('''You just won your mortal soul!
And after a lifetime of joy,
do you want to try''',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 60, color: Colors.black)),
        ),
        TextButton(
          onPressed: () {
            context.router.push(MyHomeRoute());
          },
          child: Text("Again?",
              style: TextStyle(fontSize: 100, color: Colors.black)),
        )
      ],
    );
  }
}

class LoseWidget extends StatelessWidget {
  const LoseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('''You fool!''',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 100)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text('''You just lost your mortal soul!
And after a lifetime of suffering,
do you want to try''',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 60)),
        ),
        TextButton(
          onPressed: () {
            context.router.push(MyHomeRoute());
          },
          child: Text("Again?",
              style: TextStyle(fontSize: 100, color: Colors.white)),
        )
      ],
    );
  }
}
