import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/features/auth/screen/login_screen.dart';
import 'package:city17_seller/source/features/auth/screen/sign_in_screen.dart';
import 'package:city17_seller/source/features/auth/screen/splash_screen.dart';
import 'package:city17_seller/source/features/dashboard/screen/dashboard_screen.dart';
import 'package:city17_seller/source/features/finance/screens/finance_screen.dart';
import 'package:city17_seller/source/features/home/screen/add_location_screen.dart';
import 'package:city17_seller/source/features/home/screen/connect_display_screen.dart';
import 'package:city17_seller/source/features/home/screen/display_location_screen.dart';
import 'package:city17_seller/source/features/home/screen/display_setting.dart';
import 'package:city17_seller/source/features/home/screen/home_screen.dart';
import 'package:city17_seller/source/features/offers/screens/offer_screen.dart';
import 'package:city17_seller/source/features/settings/screens/settings_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

mixin RouterFluro {
  static final FluroRouter fluroRouter = FluroRouter();

  static void initRoutes() {
    fluroRouter.notFoundHandler = _notFoundHandler;

    //--------------------------Authentication
    fluroRouter.define(
      RouteNames.splash,
      handler: splashHandler,
      transitionType: TransitionType.none,
    );
    fluroRouter.define(
      RouteNames.signIn,
      handler: signInHandler,
      transitionType: TransitionType.none,
    );
    fluroRouter.define(
      RouteNames.login,
      handler: loginHandler,
      transitionType: TransitionType.none,
    );

    //--------------------------Dashboard
    fluroRouter.define(
      RouteNames.displayLocation,
      handler: displayLocationHandler,
      transitionType: TransitionType.none,
    );
    // ------------------- Home Screen
    fluroRouter.define(
      RouteNames.home,
      handler: homeHandler,
      transitionType: TransitionType.none,
    );
    fluroRouter.define(
      RouteNames.addLocation,
      handler: addLocationHandler,
      transitionType: TransitionType.none,
    );
    fluroRouter.define(
      RouteNames.displaySetting,
      handler: displaySettingHandler,
      transitionType: TransitionType.none,
    );
    fluroRouter.define(
      RouteNames.connectDisplay,
      handler: connectDisplayHandler,
      transitionType: TransitionType.none,
    );
    // -------------------offers screen
    fluroRouter.define(
      RouteNames.offers,
      handler: offerHandler,
      transitionType: TransitionType.none,
    );
    fluroRouter.define(
      RouteNames.finance,
      handler: financeHandler,
      transitionType: TransitionType.none,
    );
    fluroRouter.define(
      RouteNames.settings,
      handler: settingsHandler,
      transitionType: TransitionType.none,
    );
  }

  //................. auth Handler
  static var signInHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const SignInScreen();
    },
  );
  static var splashHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const SplashScreen();
    },
  );
  static var displayLocationHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const DisplayLocationScreen();
    },
  );
  static var addLocationHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const AddLocationScreen();
    },
  );
  static var connectDisplayHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const ConnectDisplayScreen();
    },
  );
  static var displaySettingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const DisplaySettingScreen();
    },
  );
  static var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const LoginScreen();
    },
  );

  //--------------------- DashboardHandler
  static var dashboardHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const DashboardScreen();
    },
  );
  static var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const HomeScreen();
    },
  );
  static var offerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const OfferScreen();
    },
  );
  static var financeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const FinanceScreen();
    },
  );
  static var settingsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const SettingsScreen();
    },
  );

  static final Handler _notFoundHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text('Not Found'),
          ],
        ),
      ),
    ),
  );
}
