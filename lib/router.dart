import 'package:ecogo_mobile_app/screens/home.dart';
import 'package:ecogo_mobile_app/screens/shop.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static FluroRouter router = FluroRouter();
  // static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => LoginPage());
  static final Handler _homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const HomeScreen();
    },
  );

  static final Handler _shopHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const ShopScreen();
    },
  );
  static void setupRouter() {
    router.define(
      '/',
      handler: _homeHandler,
    );
    router.define(
      '/shop',
      handler: _shopHandler,
      transitionType: TransitionType.inFromBottom,
    );
  }
}
