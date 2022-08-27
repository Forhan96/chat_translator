import 'package:chat_translator/chat_translator_app.dart';
import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/screens/home_screen.dart';
import 'package:chat_translator/screens/sign_in_screen.dart';
import 'package:chat_translator/screens/signup_journey/sign_up_screen.dart';
import 'package:chat_translator/screens/splash_screen.dart';
import 'package:fluro/fluro.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

  static final Handler _authWrapperHandler =
      Handler(handlerFunc: (context, parameters) => const AuthenticationWrapper());

  static final Handler _splashScreenHandler = Handler(handlerFunc: (context, parameters) => SplashScreen());

  //account
  static final Handler _signInScreenHandler = Handler(handlerFunc: (context, parameters) => SignInScreen());
  static final Handler _signUpScreenHandler = Handler(handlerFunc: (context, parameters) => SignUpScreen());

  static final Handler _homeScreenHandler = Handler(handlerFunc: (context, parameters) => HomeScreen());

  static final Handler _notFoundHandler = Handler(handlerFunc: (context, parameters) {
    print("No Router Found!");
    return null;
  });
  void setupRouter() {
    //account
    router.define(
      Routes.AUTH_WRAPPER,
      handler: _authWrapperHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      Routes.SPLASH_SCREEN,
      handler: _splashScreenHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      Routes.SIGN_IN_SCREEN,
      handler: _signInScreenHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      Routes.SIGN_UP_SCREEN,
      handler: _signUpScreenHandler,
      transitionType: TransitionType.cupertino,
    );

    router.define(
      Routes.HOME_SCREEN,
      handler: _homeScreenHandler,
      transitionType: TransitionType.cupertino,
    );

    router.notFoundHandler = _notFoundHandler;
  }
}
