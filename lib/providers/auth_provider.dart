import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _isLogged = false;
  bool _loading = false;

  bool get isLogged => _isLogged;
  bool get loading => _loading;

  set isLogged(bool value) {
    _isLogged = value;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool isUserSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  bool isVerified() {
    return _firebaseAuth.currentUser?.emailVerified ?? false;
  }

  String? uid() {
    return _firebaseAuth.currentUser?.uid;
  }

  Future<String> signUp(String email, String password) async {
    String? errorMessage;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      print("=================${error.code}___${error.message}");
      switch (error.code) {
        case "weak-password":
          errorMessage = "The password provided is too weak.";
          break;
        case "email-already-in-use":
          errorMessage = "The account already exists for that email.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
    if (errorMessage != null) {
      return errorMessage;
    }

    return "success";
  }

  Future<String> signIn(String email, String password) async {
    String? errorMessage;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      await _firebaseAuth.currentUser?.sendEmailVerification();
      _isLogged = true;
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      print("=================${error.code}___${error.message}");
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
    if (errorMessage != null) {
      return errorMessage;
    }

    return "success";
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _isLogged = false;
    notifyListeners();
  }
}
