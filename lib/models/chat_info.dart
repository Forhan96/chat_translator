import 'package:chat_translator/models/user.dart';

class ChatInfo {
  final UserData fromUser;
  final UserData toUser;
  final String groupID;

  const ChatInfo(this.fromUser, this.toUser, this.groupID);

  String getGroupChatId() {
    if (fromUser.id.hashCode <= toUser.id.hashCode) {
      return '${fromUser.id}_${toUser.id}';
    }
    return '${toUser.id}_${fromUser.id}';
  }
}
