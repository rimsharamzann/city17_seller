import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();
  static final NavigationService instance = NavigationService._();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
