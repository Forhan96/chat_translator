import 'package:chat_translator/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RepositoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> setUserData(UserData userData) async {
    await _firestore.collection('users').doc(userData.id).set(userData.toMap(), SetOptions(merge: true));
  }

  Future<UserData?> getUserData(String userId) async {
    ///currentUser= true, means fcmToken will be updated.
    ///Do Not set currentUser=true for other user
    var result = await _firestore.collection('users').doc(userId).get();
    // if (currentUser) {
    //   try {
    //     if (result.exists) {
    //       //update users token!
    //       await _firestore.collection('users').doc(userId).update({"firebaseToken": await FirebaseMessaging.instance.getToken()});
    //       result = await _firestore.collection('users').doc(userId).get();
    //     }
    //   } catch (e) {
    //     await _firestore.collection('users').doc(userId).update({"firebaseToken": await FirebaseMessaging.instance.getToken()});
    //     result = await _firestore.collection('users').doc(userId).get();
    //   }
    // }
    final Map<String, dynamic>? doc = result.data();
    return doc == null ? null : UserData.fromJson(doc);
  }
}
