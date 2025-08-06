import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/features/auth/screen/login_screen.dart';
import 'package:city17_seller/source/features/auth/screen/sign_in_screen.dart';
import 'package:city17_seller/source/features/auth/screen/splash_screen.dart';
import 'package:city17_seller/source/features/finance/screens/finance_screen.dart';
import 'package:city17_seller/source/features/home/screen/add_location_screen.dart';
import 'package:city17_seller/source/features/home/screen/connect_display_screen.dart';
import 'package:city17_seller/source/features/home/screen/display_location_screen.dart';
import 'package:city17_seller/source/features/home/screen/display_setting.dart';
import 'package:city17_seller/source/features/home/screen/home_screen.dart';
import 'package:city17_seller/source/features/offers/screens/offer_screen.dart';
import 'package:city17_seller/source/features/settings/screens/buyer_details.dart';
import 'package:city17_seller/source/features/settings/screens/notifications.dart';
import 'package:city17_seller/source/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case RouteNames.home:
        page = const HomeScreen();
        break;
      case RouteNames.splash:
        page = const SplashScreen();
        break;
      case RouteNames.signIn:
        page = const SignUpScreen();
        break;
      case RouteNames.login:
        page = LoginScreen();
        break;
      case RouteNames.displayLocation:
        page = const DisplayLocationScreen();
        break;
      case RouteNames.addLocation:
        page = const AddLocationScreen();
        break;
      case RouteNames.connectDisplay:
        page = const ConnectDisplayScreen();
        break;
      case RouteNames.displaySetting:
        page = const DisplaySettingScreen();
        break;
      case RouteNames.offers:
        page = const OfferScreen();
        break;
      case RouteNames.finance:
        page = const FinanceScreen();
        break;
      case RouteNames.buyerDetails:
        page = const BuyerDetailScreen();
        break;
      case RouteNames.notifications:
        page = const NotificationsScreen();
        break;
      case RouteNames.settings:
        page = const SettingsScreen();
        break;
      default:
        page = const Scaffold(
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
                Text('Page Not Found'),
              ],
            ),
          ),
        );
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: RouteSettings(name: settings.name),
    );
  }
}
