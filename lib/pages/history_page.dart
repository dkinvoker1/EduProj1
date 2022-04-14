import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/result.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var _resultsStream =
      FirebaseFirestore.instance.collection('results').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _resultsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Text("Waiting for data")
                : ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      var a = Result.fromJson(data);
                      return ListTile(
                        title: Text(a.isHeven ? "Heven" : "Hell"),
                      );
                    }).toList(),
                  );
          }),
    );
  }
}
