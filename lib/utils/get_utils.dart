import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:web/web.dart' as web;

mixin GetUtils {
  static void refreshPage() {
    web.window.location.reload();
  }

  static bool validateURL(String? input) {
    if (input != null) {
      return Uri.parse(input).host.isNotEmpty;
    } else {
      return false;
    }
  }

  static bool isCurrentRoute(BuildContext context, String routeName) {
    return ModalRoute.of(context)?.settings.name?.contains(routeName) ?? false;
  }

  static bool selectedRoute(BuildContext context, String routeName) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == null) {
      return false;
    }
    return currentRoute.contains(routeName);
  }
}
