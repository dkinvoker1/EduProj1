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
              toFirestore: (movie, _) => movie.toJson(),
            );

    await resultsRef.add(
      Result(userUid: _getUId(), isHeven: isHeven),
    );
  }

  Stream<QuerySnapshot<Result>> getResultStream() {
    return FirebaseFirestore.instance
        .collection('results')
        .where('userUid', isEqualTo: _getUId())
        .withConverter<Result>(
          fromFirestore: (snapshot, _) => Result.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        )
        .snapshots();
  }
}
