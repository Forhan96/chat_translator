import 'package:chat_translator/models/user.dart';
import 'package:chat_translator/providers/auth_provider.dart';
import 'package:chat_translator/providers/personal_info_provider.dart';
import 'package:chat_translator/router/router_helper.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/screens/home_screen.dart';
import 'package:chat_translator/screens/sign_in_screen.dart';
import 'package:chat_translator/screens/signup_journey/personal_info_screen.dart';
import 'package:chat_translator/screens/signup_journey/verify_screen.dart';
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
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat Translator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthenticationWrapper(),
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    PersonalInfoProvider personalInfoProvider = Provider.of(context, listen: false);
    if (authProvider.isUserSignedIn()) {
      if (authProvider.isVerified()) {
        personalInfoProvider.getUserData(authProvider.uid() ?? "");
        UserData? userData = personalInfoProvider.userData;
        if (userData == null) {
          return PersonalInfoScreen();
        }
        return HomeScreen();
      } else {
        return VerifyScreen();
      }
    } else {
      return SignInScreen();
    }
  }
}
