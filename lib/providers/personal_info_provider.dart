import 'package:chat_translator/models/user.dart';
import 'package:chat_translator/services/repository_service.dart';
import 'package:flutter/material.dart';

class PersonalInfoProvider extends ChangeNotifier {
  final RepositoryService _repositoryService = RepositoryService();

  Future<void> setUserData(UserData userData) async {
    _repositoryService.setUserData(userData);
  }

  Future<UserData?> getUserData(String uid) async {
    return _repositoryService.getUserData(uid);
  }
}
