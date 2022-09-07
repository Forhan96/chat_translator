import 'dart:async';

import 'package:chat_translator/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

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

  Future<String> signUp(String email, String password) async {
    return await _authService.signUp(email, password);
  }

  Future<String> signIn(String email, String password) async {
    return await _authService.signIn(email, password);
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _isLogged = false;
    notifyListeners();
  }

  bool isUserSignedIn() {
    return _authService.isUserSignedIn();
  }

  bool isVerified() {
    return _authService.isVerified();
  }

  String? uid() {
    return _authService.uid();
  }
}
