import 'package:chat_translator/models/chat_info.dart';
import 'package:chat_translator/models/message.dart';
import 'package:chat_translator/services/repository_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider with ChangeNotifier {
  final RepositoryService _repositoryService = RepositoryService();

  // String _message = "";
  //
  // String get message => _message;
  //
  // set message(String value) {
  //   _message = value;
  //   notifyListeners();
  // }

  List _messages = [];
  List get messages => _messages;

  Future<bool> checkDocExists(String docId) async {
    return await _repositoryService.checkDocExists(docId);
  }

  Future<void> createChat(ChatInfo chatInfo) async {
    await _repositoryService.createChat(chatInfo.getChatId(), chatInfo.fromUser.id, chatInfo.toUser.id);
  }

  Future<void> sendMessage(ChatInfo chatInfo, String content, int type) async {
    await _repositoryService.sendMessage(chatInfo, content, type);
    await _repositoryService.setChatLastMsg(chatInfo, content);
  }

  Future<void> getMessages(ChatInfo chatInfo) async {
    Stream messages = _repositoryService.getMessages(chatInfo.getChatId(), 20);
    messages.listen((event) {
      var docs = event.docs;
      for (DocumentSnapshot<Map<String, dynamic>> doc in docs) {
        _messages.add(Message.fromJson(doc.data()));

        // print(doc.data());
        print(_messages.toString());
      }
      // print(event.docs.toString());
    });
  }
}
