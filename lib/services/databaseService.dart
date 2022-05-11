import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/result.dart';

@singleton
class DatabaseService {
  String _getUId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<void> addResult(bool isHeven) async {
    final resultsRef =
        FirebaseFirestore.instance.collection('results').withConverter<Result>(
              fromFirestore: (snapshot, _) => Result.fromJson(snapshot.data()!),
              toFirestore: (result, _) => result.toJson(),
            );

    await resultsRef.add(
      Result(
          userUid: _getUId(),
          isHeven: isHeven,
          time: DateTime.now().microsecondsSinceEpoch),
    );
  }

  Stream<QuerySnapshot<Result>> getResultStream() {
    return FirebaseFirestore.instance
        .collection('results')
        .where('userUid', isEqualTo: _getUId())
        .withConverter<Result>(
          fromFirestore: (snapshot, _) => Result.fromJson(snapshot.data()!),
          toFirestore: (result, _) => result.toJson(),
        )
        .snapshots();
  }

  Stream<Iterable<QueryDocumentSnapshot<Result>>> getResultStreamByDate(
      DateTime date) {
    DateTime dayStart = DateTime(date.year, date.month, date.day);
    DateTime dayEnd = DateTime(date.year, date.month, date.day + 1);

    var resultStream = FirebaseFirestore.instance
        .collection('results')
        .withConverter<Result>(
          fromFirestore: (snapshot, _) => Result.fromJson(snapshot.data()!),
          toFirestore: (result, _) => result.toJson(),
        )
        .snapshots();

    final map = resultStream.map((snapshot) => snapshot.docs.where((doc) =>
        doc.data().userUid == _getUId() &&
        dayStart.microsecondsSinceEpoch <= doc["time"] &&
        doc.data().time < dayEnd.microsecondsSinceEpoch));

    return map;
  }
}
