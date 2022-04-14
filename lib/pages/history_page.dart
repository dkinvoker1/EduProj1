import 'package:auto_route/auto_route.dart';
import 'package:edu_proj1/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/result.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var _resultsStream = FirebaseFirestore.instance
      .collection('results')
      .withConverter<Result>(
        fromFirestore: (snapshot, _) => Result.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      )
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _resultsStream,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Result>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Waiting for data");
            }

            var _hevenCount = snapshot.data!.docs
                .where((element) => element.data().isHeven)
                .length;

            var _hellCount = snapshot.data!.docs
                .where((element) => !element.data().isHeven)
                .length;

            return Center(
              child: Column(
                children: [
                  Expanded(
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text("Heven: " + _hevenCount.toString()))),
                  Expanded(
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text("Hell: " + _hellCount.toString()))),
                  Expanded(
                      child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: IconButton(
                        onPressed: () async {
                          context.router.push(MyHomeRoute());
                        },
                        icon: Icon(Icons.arrow_back_rounded)),
                  ))
                ],
              ),
            );
          }),
    );
  }
}
