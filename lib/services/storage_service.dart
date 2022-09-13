import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<TaskSnapshot> uploadUserAvatar(String userId, File image) async {
    final storageRef = _firebaseStorage.ref('profile_pictures/');
    final Reference reference = storageRef.child(userId).child(randomString(15));
    final UploadTask uploadTask = reference.putFile(image);
    await uploadTask;
    return uploadTask.snapshot;
  }
}
