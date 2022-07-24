// ignore_for_file: inference_failure_on_function_invocation, avoid_print

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_contacts/provider/auth_provider.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name = '';

  Stream<User?> get authStateChange => _auth.authStateChanges();

  // Future<Void> getUserName(User user) async {
  //   final DocumentReference ref =
  //       dataProvider.collection('users').doc(user.uid);

  //   final snapshot = await ref.get();
  //   name = snapshot.get('Name').toString();

  //   // return name;
  // }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      // name = getUserName(user!) as String;
      final DocumentReference ref =
          dataProvider.collection('users').doc(user?.uid);

      final snapshot = await ref.get();
      name = snapshot.get('Name').toString();
      debugPrint(snapshot.get('Name').toString());
      debugPrint(snapshot.data().toString());
      debugPrint(name);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Ocured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> createUser(String? uid, String username, String email) async {
    await dataProvider.collection('users').doc(uid).set({
      'Name': username,
      'Email': email,
    });
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
    BuildContext context,
  ) async {
    try {
      final result = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      await createUser(result?.uid, name, email);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error ocured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.');
      } else {
        print('Error: $e');
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
