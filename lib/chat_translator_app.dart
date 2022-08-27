import 'package:chat_translator/providers/auth_provider.dart';
import 'package:chat_translator/router/router_helper.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/screens/home_screen.dart';
import 'package:chat_translator/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat Translator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthenticationWrapper(),
        // home: _authProvider.isUserSignedIn() ? HomeScreen() : SignInScreen(),
        onGenerateRoute: RouterHelper.router.generator,
        initialRoute: Routes.SPLASH_SCREEN,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (_authProvider.isUserSignedIn()) {
      return HomeScreen();
    } else {
      return SignInScreen();
    }
  }
}
