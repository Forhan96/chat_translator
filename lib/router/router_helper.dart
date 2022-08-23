import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/screens/sign_in_screen.dart';
import 'package:chat_translator/screens/sign_up_screen.dart';
import 'package:fluro/fluro.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

  //account
  static final Handler _signInScreenHandler = Handler(handlerFunc: (context, parameters) => SignInScreen());
  static final Handler _signUpScreenHandler = Handler(handlerFunc: (context, parameters) => SignUpScreen());

  static final Handler _notFoundHandler = Handler(handlerFunc: (context, parameters) {
    print("No Router Found!");
    return null;
  });
  void setupRouter() {
    //account
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

    router.notFoundHandler = _notFoundHandler;
  }
}
