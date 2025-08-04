import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/services/navigation_services.dart';
import 'package:flutter/material.dart';

import '../../config/responsive_widget.dart';
import 'my_colors.dart';

mixin Constants {
  static final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(myBorderRadius),
    borderSide: BorderSide.none,
  );
  static final enabledInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(myBorderRadius),
    borderSide: BorderSide.none,
  );
  static final errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(myBorderRadius),
    borderSide: const BorderSide(color: Colors.red, width: 1.5),
  );
  static InputDecoration textFieldInputDecoration({
    required BuildContext context,
    required String hintText,
    bool filled = true,
    Widget? suffixIcon,
    bool showLabel = true,
    bool smallText = true,
    Widget? prefixIcon,
    Color? color,
    Color? fillColor,
    EdgeInsetsGeometry? contentPadding,
  }) => InputDecoration(
    labelText: showLabel ? hintText : null,
    hintText: !showLabel ? hintText : null,
    filled: filled,
    fillColor: fillColor ?? MyColors.containerColor.withValues(alpha: 0.3),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    contentPadding:
        contentPadding ??
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    hintStyle: TextStyle(
      fontSize: smallText ? 10 : 14,
      color: color ?? Colors.grey,
      fontWeight: FontWeight.w300,
    ),
    labelStyle: TextStyle(
      fontSize: smallText ? 10 : 14,
      color: color ?? Colors.grey,
    ),
    border: Constants.outlineInputBorder,
    disabledBorder: Constants.outlineInputBorder,
    focusedBorder: Constants.enabledInputBorder,
    enabledBorder: Constants.outlineInputBorder,
    errorBorder: Constants.errorInputBorder,
    counterText: '',
  );

  // static InputDecoration textFieldInputDecoration({
  //   required String hintText,
  //   bool filled = true,
  //   Widget? suffixIcon,
  //   String? prefixImage,
  //   Function()? prefixOnTap,
  //   bool showLabel = false,
  //   bool smallText = false,
  //   Widget? prefixIcon,
  //   bool alignLabelWithHint = false,
  //   EdgeInsetsGeometry? contentPadding,
  //   Color? color,
  // }) => InputDecoration(
  //   labelText: showLabel ? hintText : null,
  //   hintText: !showLabel ? hintText : null,
  //   counterText: '',
  //   hintStyle: TextStyle(
  //     fontSize: smallText ? 14 : 16,
  //     fontWeight: FontWeight.normal,
  //     color: color,
  //   ),
  //   labelStyle: TextStyle(
  //     fontSize: smallText ? 14 : 16,
  //     fontWeight: FontWeight.normal,
  //     color: color,
  //   ),
  //   filled: filled,
  //   fillColor: MyColors.containerColor.withValues(alpha: 0.3),
  //   suffixIcon: suffixIcon,
  //   contentPadding:
  //       contentPadding ??
  //       (ResponsiveWidget.isSmallScreen(myContext!)
  //           ? const EdgeInsets.symmetric(
  //               horizontal: myPadding / 1.3,
  //               vertical: myPadding / 1.3,
  //             )
  //           : const EdgeInsets.symmetric(
  //               vertical: 20,
  //               horizontal: myPadding / 1.5,
  //             )),
  //   prefixIcon: prefixIcon,
  //   border: Constants.outlineInputBorder,
  //   disabledBorder: Constants.outlineInputBorder,
  //   focusedBorder: Constants.enabledInputBorder,
  //   enabledBorder: Constants.outlineInputBorder,
  //   errorBorder: Constants.errorInputBorder,
  // );

  static List<String> months = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static List<int> availableRows = [5, 10, 20, 50, 100];
  static int rowsPerPage = 5;
}

BuildContext? myContext =
    NavigationService.instance.navigatorKey.currentContext;
double myButtonWidth = (myContext == null)
    ? double.infinity
    : ResponsiveWidget.isSmallScreen(myContext!)
    ? double.infinity
    : ResponsiveWidget.isMediumScreen(myContext!)
    ? (myContext!.width / 2)
    : 400;
const double myButtonHeight = 44;
const double mySideBarWidth = 280;
const double myBorderRadius = 10;
const double myAppBarBarAndHeadingWidth = 116;
const double myPadding = 16;
double myAppBarHeight = myContext == null
    ? 72
    : ResponsiveWidget.isSmallScreen(myContext!)
    ? 64
    : 72;
double scrollOffset = 0.0;
