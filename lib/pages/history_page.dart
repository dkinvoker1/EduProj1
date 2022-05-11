import 'package:auto_route/auto_route.dart';
import 'package:edu_proj1/routes/router.gr.dart';
import 'package:edu_proj1/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/result.dart';

class HistoryPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final errorTextState = useState<DateTime?>(null);

    return Scaffold(
      body: Row(
        children: [
          Flexible(
              child: DateColumn(
            chosenDate: errorTextState,
          )),
          VerticalDivider(thickness: 6),
          Flexible(
              flex: 3,
              child: DetailSection(
                date: errorTextState.value,
              )),
        ],
      ),
    );
  }
}

class DateColumn extends StatelessWidget {
  const DateColumn({
    Key? key,
    required ValueNotifier<DateTime?> chosenDate,
  })  : _chosenDate = chosenDate,
        super(key: key);

  final ValueNotifier<DateTime?> _chosenDate;

  @override
  Widget build(BuildContext context) {
    var _resultsStream = DatabaseService().getResultStream();
    return StreamBuilder(
        stream: _resultsStream,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Result>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          var dates = snapshot.data!.docs
              .map((e) => DateFormat('dd-MM-yyyy')
                  .format(DateTime.fromMicrosecondsSinceEpoch(e.data().time)))
              .toSet()
              .toList();

          return Center(
            child: Column(
              children: [
                Text('Date'),
                Flexible(
                  child: ListView.builder(
                      itemCount: dates.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextButton(
                            onPressed: () {
                              _chosenDate.value =
                                  DateFormat('dd-MM-yyyy').parse(dates[index]);
                            },
                            child: Container(
                              height: 50,
                              child: Center(child: Text('${dates[index]}')),
                            ));
                      }),
                ),
              ],
            ),
          );
        });
  }
}

class DetailSection extends StatelessWidget {
  const DetailSection({
    Key? key,
    required DateTime? date,
  })  : _date = date,
        super(key: key);

  final DateTime? _date;

  @override
  Widget build(BuildContext context) {
    if (_date == null) {
      return Container();
    }

    var _resultsStream = DatabaseService().getResultStreamByDate(_date!);

    return StreamBuilder(
        stream: _resultsStream,
        builder: (BuildContext context,
            AsyncSnapshot<Iterable<QueryDocumentSnapshot<Result>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          var _hevenCount =
              snapshot.data!.where((element) => element.data().isHeven).length;

          var _hellCount =
              snapshot.data!.where((element) => !element.data().isHeven).length;

          return Center(
            child: Column(
              children: [
                Expanded(
                    child: FittedBox(
                        fit: BoxFit.fitWidth, child: Text('History'))),
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
        });
  }
}
