import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
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
    this.backgroundCOlor,
    this.labelStyle,
  });
  final TabController controller;
  final List<Widget> tabs;
  final Decoration? indicatorDecoration;
  final Color? unselectedLabelColor;
  final Color? labelColor;
  final Color? indicatorColor;
  final Color? backgroundCOlor;
  final TabIndicatorAnimation? indicatorAnimation;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundCOlor ?? Colors.transparent,
      ),
      child: TabBar(
        controller: controller,
        tabs: tabs,
        labelStyle: labelStyle ?? context.textTheme.bodyMedium,
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
