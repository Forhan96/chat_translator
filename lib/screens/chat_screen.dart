import 'package:chat_translator/components/app_text_field.dart';
import 'package:chat_translator/components/default_container.dart';
import 'package:chat_translator/models/chat_info.dart';
import 'package:chat_translator/providers/chat_provider.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final ChatInfo chatInfo;
  ChatScreen({Key? key, required this.chatInfo}) : super(key: key);

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    chatProvider.getMessages(chatInfo);

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
              Expanded(
                child: ListView.builder(
                    reverse: true,
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      var item = chatProvider.messages[index];
                      // return AnimatedContainer(
                      //   width: item.translationLang ? 200.0 : 100.0,
                      //   height: selected ? 100.0 : 200.0,
                      //   color: selected ? Colors.red : Colors.blue,
                      //   alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                      //   duration: const Duration(seconds: 2),
                      //   curve: Curves.fastOutSlowIn,
                      //   child: Text(item.contentLang),
                      // );
                      return ListTile(
                        title: Text(item.contentLang),
                      );
                    }),
              ),
              ChatInputModule(
                chatInfo: chatInfo,
                messageController: messageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatInputModule extends StatelessWidget {
  const ChatInputModule({
    Key? key,
    required this.chatInfo,
    required this.messageController,
  }) : super(key: key);

  final ChatInfo chatInfo;
  final TextEditingController messageController;
  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context, listen: false);

    return DefaultContainer(
      padding: const EdgeInsets.all(10),
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
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.send_rounded,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
