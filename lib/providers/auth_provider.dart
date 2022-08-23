import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _isLogged = false;

  bool get isLogged => _isLogged;

  set isLogged(bool value) {
    _isLogged = value;
    notifyListeners();
  }

  // StreamSubscription<User?> get authStateChanges {
  //   return _firebaseAuth.authStateChanges().listen(
  //     (User? user) {
  //       if (user == null) {
  //         _isLogged = false;
  //         print('User is currently signed out!');
  //       } else {
  //         _isLogged = true;
  //         print('User is signed in!');
  //       }
  //     },
  //   );
  // }

  Future<void> signUp(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    _isLogged = true;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _isLogged = false;
    notifyListeners();
  }
}
