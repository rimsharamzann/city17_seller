import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({
    super.key,
    required this.controller,
    required this.tabs,
    this.indicatorDecoration,
    this.unselectedLabelColor,
    this.labelColor,
    this.indicatorColor,
    this.indicatorAnimation,
  });
  final TabController controller;
  final List<Widget> tabs;
  final Decoration? indicatorDecoration;
  final Color? unselectedLabelColor;
  final Color? labelColor;
  final Color? indicatorColor;
  final TabIndicatorAnimation? indicatorAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: TabBar(
        controller: controller,
        tabs: tabs,
        indicator:
            indicatorDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: indicatorColor ?? MyColors.darkThemeBottomAppBarColor,
            ),
        unselectedLabelColor: unselectedLabelColor ?? Colors.white70,
        labelColor: labelColor ?? Colors.white,
        indicatorColor: indicatorColor ?? MyColors.primaryColor,
        dividerColor: MyColors.containerBg,
        splashBorderRadius: BorderRadius.circular(8),
        indicatorAnimation: indicatorAnimation ?? TabIndicatorAnimation.linear,
      ),
    );
  }
}
