import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:edu_proj1/routes/router.gr.dart';
import 'package:flutter/material.dart';

import '../flavors.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    int _winChance = F.winChance;
    var _isSucces = Random().nextInt(100) < _winChance;
    var _congratulation = _isSucces ? '''Congratulations!''' : '''You fool!''';
    var _explaination = _isSucces
        ? '''You just won your mortal soul!
And after a lifetime of joy,
do you want to try'''
        : '''You just lost your mortal soul!
And after a lifetime of suffering,
do you want to try''';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: _isSucces
                    ? AssetImage('assets/heven.jpg')
                    : AssetImage('assets/hell.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: FittedBox(
                  child: Text(_congratulation, textAlign: TextAlign.center)),
              ),
              Expanded(
                flex: 3,
                child: FittedBox(
                  child: Text(
                    _explaination,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FittedBox(
                  child: TextButton(
                    onPressed: () {
                      context.router.push(MyHomeRoute());
                    },
                    child: Text("Again?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: _isSucces ? Colors.black : Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
