import 'dart:io';

import 'package:chat_translator/providers/disposable_provider.dart';
import 'package:chat_translator/services/auth_service.dart';
import 'package:chat_translator/services/repository_service.dart';
import 'package:chat_translator/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageChangeProvider extends DisposableProvider {
  final AuthService _authService = AuthService();
  final StorageService _storageService = StorageService();
  final RepositoryService _repositoryService = RepositoryService();

  bool _imageChanged = false;
  bool get imageChanged => _imageChanged;
  set imageChanged(bool value) {
    _imageChanged = value;
    notifyListeners();
  }

  File _finalFile = File("");
  File get finalFile => _finalFile;
  set finalFile(File file) {
    _finalFile = file;
    notifyListeners();
  }

  Future<void> uploadUserAvatar(File image) async {
    final TaskSnapshot doc = await _storageService.uploadUserAvatar(_authService.uid() ?? "", image);
    String downloadUrl = await doc.ref.getDownloadURL();
    Map<String, dynamic> data = {"avatar": downloadUrl};
    await _repositoryService.updateUserData(_authService.uid() ?? "", data);
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
