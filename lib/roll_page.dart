import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:edu_proj1/routes/router.gr.dart';
import 'package:flutter/material.dart';

class RollPage extends StatefulWidget {
  RollPage({Key? key}) : super(key: key);

  @override
  _RollPageState createState() => _RollPageState();
}

class _RollPageState extends State<RollPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, () {
      context.router.push(ResultRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
