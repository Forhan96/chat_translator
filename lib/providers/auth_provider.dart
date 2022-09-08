import 'dart:async';

import 'package:chat_translator/models/user.dart';
import 'package:chat_translator/services/auth_service.dart';
import 'package:chat_translator/services/repository_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  final RepositoryService _repositoryService = RepositoryService();

  bool _isLogged = false;
  bool _loading = false;
  UserData? _userData;

  bool get isLogged => _isLogged;
  bool get loading => _loading;
  UserData? get userData => _userData;

  set isLogged(bool value) {
    _isLogged = value;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set userData(UserData? userData) {
    _userData = userData;
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

  Future<void> setUserData(UserData userData) async {
    await _repositoryService.setUserData(userData);
    _loading = false;
    notifyListeners();
  }

  Future<void> getUserData(String uid) async {
    UserData? userData = await _repositoryService.getUserData(uid);
    _userData = userData;
    _loading = false;
    notifyListeners();
  }
}
