import 'package:chat_translator/models/chat_info.dart';
import 'package:chat_translator/models/message.dart';
import 'package:chat_translator/services/repository_service.dart';
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

  List<Message> _messages = [];
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
    _repositoryService.getMessages(chatInfo.getChatId(), 20).listen((event) {
      var docs = event.docs;
      // for (DocumentSnapshot<Map<String, dynamic>> doc in docs) {
      //   _messages.add(Message.fromJson(doc.data()));
      //
      //   // print(doc.data());
      //   print(_messages.toString());
      // }
      docs.forEach((element) {
        _messages.add(Message.fromJson(element.data() as Map<String, dynamic>));
      });
      print(_messages.length);
      print(_messages);

      // print(event.docs.toString());
    });
  }
}
