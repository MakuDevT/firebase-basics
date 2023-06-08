import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_basics/src/data/job.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRepository {
  FirestoreRepository(this._firestore);
  final FirebaseFirestore _firestore;

  Future<void> addJob(String uid, String title, String company) =>
      (_firestore.collection('users/$uid/jobs').add({
        'title': title,
        'company': company,
        'createdAt': FieldValue.serverTimestamp()
      }));
  Future<void> updateJob(
          String uid, String jobId, String title, String company) =>
      (_firestore.doc('users/$uid/jobs/$jobId').update({
        'title': title,
        'company': company,
      }));
  Future<void> deleteJob(String uid, String jobId) =>
      _firestore.doc('users/$uid/jobs/$jobId').delete();

  Query<Job> jobsQuery(String uid) {
    //converter let us plug in our data serialization logic
    //so we don't have to deal with key value pairs in the rest of the codebase
    return _firestore
        .collection('users/$uid/jobs')
        .withConverter(
            fromFirestore: (snapshot, _) => Job.fromMap(snapshot.data()!),
            toFirestore: (job, _) => job.toMap())
        .orderBy('createdAt', descending: true);
  }
}

final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) {
  return FirestoreRepository(FirebaseFirestore.instance);
});
