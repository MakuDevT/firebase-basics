import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_basics/src/data/job.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRepository {
  FirestoreRepository(this._firestore);
  final FirebaseFirestore _firestore;

  Future<void> addJob(String uid, String title, String company) =>
      (_firestore.collection('jobs').add({
        'uid': uid,
        'title': title,
        'company': company,
      }));
  Future<void> updateJob(
          String uid, String jobId, String title, String company) =>
      (_firestore.doc('jobs/$jobId').update({
        'uid': uid,
        'title': title,
        'company': company,
      }));
  Future<void> deleteJob(String uid, String jobId) =>
      _firestore.doc('jobs/$jobId').delete();

  Query<Job> jobsQuery() {
    //converter let us plug in our data serialization logic
    //so we don't have to deal with key value pairs in the rest of the codebase
    return _firestore.collection('jobs').withConverter(
        fromFirestore: (snapshot, _) => Job.fromMap(snapshot.data()!),
        toFirestore: (job, _) => job.toMap());
  }
}

final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) {
  return FirestoreRepository(FirebaseFirestore.instance);
});
