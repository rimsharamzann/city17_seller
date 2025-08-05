import 'package:city17_seller/source/constants/string_data.dart';

enum PaymentSchedule { daily, weekly, monthly }

extension PaymentScheduleExtension on PaymentSchedule {
  String get title {
    switch (this) {
      case PaymentSchedule.daily:
        return StringData.daily;
      case PaymentSchedule.weekly:
        return StringData.weekly;
      case PaymentSchedule.monthly:
        return StringData.monthly;
    }
  }
}
