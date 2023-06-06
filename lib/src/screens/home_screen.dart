import 'package:faker/faker.dart';
import 'package:firebase_basics/src/data/firestore_repository.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../routing/app_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Jobs'), actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => context.goNamed(AppRoute.profile.name),
        )
      ]),
      body: const JobListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final user = ref.read(firebaseAuthProvider).currentUser;
          final faker = Faker();
          final title = faker.job.title();
          final company = faker.company.name();
          ref
              .read(firestoreRepositoryProvider)
              .addJob(user!.uid, title, company);
        },
      ),
    );
  }
}

class JobListView extends ConsumerWidget {
  const JobListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreRepository = ref.watch(firestoreRepositoryProvider);
    return FirestoreListView(
      query: firestoreRepository.jobsQuery(),
      itemBuilder: (BuildContext context,
          QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        return ListTile(
          title: Text(doc['title']),
          subtitle: Text(doc['company']),
        );
      },
    );
  }
}
