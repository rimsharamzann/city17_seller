import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.largeScreen,
    this.mediumScreen,
    required this.smallScreen,
  });
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget smallScreen;

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 650;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1080;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 650 &&
        MediaQuery.of(context).size.width <= 1080;
  }

  static bool isExtraLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1080;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1080) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1080 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? smallScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}
