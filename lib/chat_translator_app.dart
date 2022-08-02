import 'package:chat_translator/router/router_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTranslatorApp extends StatefulWidget {
  const ChatTranslatorApp({Key? key}) : super(key: key);

  @override
  State<ChatTranslatorApp> createState() => _ChatTranslatorAppState();
}

class _ChatTranslatorAppState extends State<ChatTranslatorApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RouterHelper().setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter_ScreenUtil',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
