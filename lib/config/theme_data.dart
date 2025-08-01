import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'responsive_widget.dart';

mixin MainThemeData {
  static ThemeData lightThemeData(BuildContext context) => ThemeData(
    hintColor: Colors.grey.shade600,
    cardColor: Colors.white,
    highlightColor: Colors.grey.shade200,
    scaffoldBackgroundColor: Colors.grey.shade50,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w900,
        fontSize: ResponsiveWidget.isSmallScreen(context)
            ? 19
            : ResponsiveWidget.isMediumScreen(context)
            ? 24
            : 28,
        color: Colors.black87,
      ),
      titleMedium: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
        fontSize: ResponsiveWidget.isSmallScreen(context)
            ? 16
            : ResponsiveWidget.isMediumScreen(context)
            ? 20
            : 24,
        color: Colors.black87,
      ),
      titleSmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
        fontSize: ResponsiveWidget.isSmallScreen(context)
            ? 14
            : ResponsiveWidget.isMediumScreen(context)
            ? 16
            : 18,
        color: Colors.black87,
      ),
      bodyLarge: GoogleFonts.varelaRound(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 15 : 18,
      ),
      displaySmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w700,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 28,
        color: Colors.black87,
      ),
      displayMedium: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w700,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 26 : 34,
        color: Colors.black87,
      ),
      displayLarge: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w700,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 32 : 42,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
        color: Colors.white.withValues(alpha: 0.8),
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 14.5 : 16,
      ),
      bodySmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w500,
        color: Colors.black87,
        fontSize: 14,
      ),
      headlineSmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.black87,
      ),
    ),
    primaryColor: MyColors.primaryColor,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black87),
      centerTitle: true,
      titleTextStyle: GoogleFonts.varelaRound(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white),
    ),
    tabBarTheme: TabBarThemeData(
      unselectedLabelStyle: GoogleFonts.varelaRound(),
      labelStyle: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
      ).copyWith(fontSize: 12),
      unselectedLabelColor: Colors.grey,
      indicatorColor: MyColors.primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: MyColors.primaryColor,
      labelPadding: EdgeInsets.zero,
      indicator: const UnderlineTabIndicator(borderSide: BorderSide()),
      dividerColor: Colors.grey.shade200,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          GoogleFonts.varelaRound(
            fontWeight: FontWeight.w600,
            fontSize: ResponsiveWidget.isSmallScreen(context)
                ? 14
                : ResponsiveWidget.isMediumScreen(context)
                ? 16
                : 18,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: MyColors.primaryColor,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
  );

  static ThemeData darkThemeData(BuildContext context) => ThemeData(
    hintColor: Colors.grey.shade600,
    scaffoldBackgroundColor: MyColors.backgroundColor.withValues(alpha: 0.98),
    cardColor: MyColors.containerColor,
    highlightColor: Colors.grey.shade200,

    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return MyColors.primaryColor.withValues(alpha: 0.8);
        }
        if (states.contains(WidgetState.dragged)) {
          return MyColors.primaryColor;
        }
        return MyColors.primaryColor.withValues(alpha: 0.6);
      }),
      trackColor: WidgetStateProperty.all(Colors.grey.withValues(alpha: 0.1)),
      trackBorderColor: WidgetStateProperty.all(
        Colors.grey.withValues(alpha: 0.2),
      ),

      thickness: WidgetStateProperty.all(8),
      radius: const Radius.circular(4),
      crossAxisMargin: 4,
      mainAxisMargin: 8,
      minThumbLength: 48,
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w900,
        fontSize: ResponsiveWidget.isSmallScreen(context)
            ? 19
            : ResponsiveWidget.isMediumScreen(context)
            ? 24
            : 28,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
        fontSize: ResponsiveWidget.isSmallScreen(context)
            ? 16
            : ResponsiveWidget.isMediumScreen(context)
            ? 20
            : 24,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
        fontSize: ResponsiveWidget.isSmallScreen(context)
            ? 14
            : ResponsiveWidget.isMediumScreen(context)
            ? 16
            : 18,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.varelaRound(
        color: MyColors.textColor,
        fontWeight: FontWeight.w500,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 16 : 18,
      ),
      displaySmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w700,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 28,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w700,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 26 : 34,
        color: Colors.white,
      ),
      displayLarge: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w700,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 32 : 42,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
        color: MyColors.textColor,
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 14,
      ),
      bodySmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w500,
        color: MyColors.textColor,
        fontSize: 10,
      ),
      headlineSmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    primaryColor: MyColors.primaryColor,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.backgroundColor.withValues(alpha: 0.98),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: GoogleFonts.varelaRound(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.black),
    ),
    tabBarTheme: TabBarThemeData(
      unselectedLabelStyle: GoogleFonts.varelaRound(),
      labelStyle: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
      ).copyWith(fontSize: 12),
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      // indicatorWeight: 0.5,
      indicator: const UnderlineTabIndicator(borderSide: BorderSide()),
      dividerColor: Colors.grey.shade200,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          GoogleFonts.varelaRound(
            fontWeight: FontWeight.w600,
            fontSize: ResponsiveWidget.isSmallScreen(context)
                ? 14
                : ResponsiveWidget.isMediumScreen(context)
                ? 16
                : 18,
            color: Colors.white,
          ),
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
  );
}
