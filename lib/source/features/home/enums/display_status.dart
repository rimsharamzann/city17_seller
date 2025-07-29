import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:flutter/material.dart';

enum DisplayStatus { allDisplays, online, offline, draft }

extension DisplayStatusExtension on DisplayStatus {
  String get title {
    switch (this) {
      case DisplayStatus.allDisplays:
        return StringData.allDisplays;
      case DisplayStatus.online:
        return StringData.online;
      case DisplayStatus.offline:
        return StringData.offline;
      case DisplayStatus.draft:
        return StringData.draft;
    }
  }

  Color getColor(DisplayStatus status) {
    switch (status) {
      case DisplayStatus.allDisplays:
        return MyColors.darkGradient;
      case DisplayStatus.online:
        return MyColors.successColor;
      case DisplayStatus.offline:
        return Colors.redAccent;
      case DisplayStatus.draft:
        return Colors.grey;
    }
  }
}
