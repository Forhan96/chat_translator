import 'package:chat_translator/components/app_text_field.dart';
import 'package:chat_translator/components/default_container.dart';
import 'package:chat_translator/models/chat_info.dart';
import 'package:chat_translator/providers/chat_provider.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:chat_translator/utils/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget with InputValidationMixin {
  final ChatInfo chatInfo;
  const ChatScreen({Key? key, required this.chatInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    chatProvider.getMessages(chatInfo);

    TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          chatInfo.toUser.name ?? "",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(chatInfo.fromUser.name ?? ""),
              DefaultContainer(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextInputField(
                        controller: messageController,
                        label: '',
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    DefaultContainer(
                      onTap: () {
                        String content = messageController.text;
                        chatProvider.sendMessage(chatInfo, content, 1);
                        messageController.clear();
                      },
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.send_rounded,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
