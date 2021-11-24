import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:ecogo_mobile_app/screens/home.dart';
import 'package:ecogo_mobile_app/screens/navigation.dart';
import 'package:ecogo_mobile_app/screens/profile/profile.dart';
import 'package:ecogo_mobile_app/screens/search.dart';
import 'package:ecogo_mobile_app/screens/shop/shop.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  static final Handler _searchHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const SearchScreen();
    },
  );

  static final Handler _profileHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const ProfileScreen();
    },
  );
  static final Handler _navigationHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      var name = params['name']?.first;
      var addr = params['addr']?.first;
      var lat = params['lat']?.first;
      var long = params['long']?.first;
      var score = params['score']?.first;
      var reward = params['reward']?.first;

      Destination destination = Destination(
        name,
        addr,
        LatLng(double.parse(lat), double.parse(long)),
        int.parse(score),
        int.parse(reward),
      );
      return NavigationScreen(destination: destination);
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
      transitionType: TransitionType.nativeModal,
    );

    router.define('/search',
        handler: _searchHandler, transitionType: TransitionType.fadeIn);

    router.define('/navigation',
        handler: _navigationHandler,
        transitionType: TransitionType.inFromRight);

    router.define('/profile',
        handler: _profileHandler, transitionType: TransitionType.inFromRight);
  }
}
