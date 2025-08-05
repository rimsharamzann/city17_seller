import 'package:city17_seller/source/constants/string_data.dart';

enum PaymentStatus { paid, cancelled, failed, refund }

extension PaymentStatusExtension on PaymentStatus {
  String get title {
    switch (this) {
      case PaymentStatus.paid:
        return StringData.paid;
      case PaymentStatus.cancelled:
        return StringData.cancelled;
      case PaymentStatus.failed:
        return StringData.failed;
      case PaymentStatus.refund:
        return StringData.refund;
    }
  }
}
