import 'package:city17_seller/source/constants/string_data.dart';

enum DisplayDropDown { textual, graphical, tabular }

extension DisplayDropDownExtension on DisplayDropDown {
  String get title {
    switch (this) {
      case DisplayDropDown.textual:
        return StringData.textual;
      case DisplayDropDown.graphical:
        return StringData.graphical;
      case DisplayDropDown.tabular:
        return StringData.tabular;
    }
  }
}

 enum ScheduleType {
  daily,
  weekly,
  monthly,
}
extension ScheduleTypeExtension on ScheduleType {
  String get title {
    switch (this) {
      case ScheduleType.daily:
        return 'Daily';
      case ScheduleType.weekly:
        return 'Weekly';
      case ScheduleType.monthly:
        return 'Monthly';
    }
  }
}

