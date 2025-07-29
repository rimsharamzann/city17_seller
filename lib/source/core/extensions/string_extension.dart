import 'package:city17_seller/source/constants/string_data.dart';

extension StringExt on String? {
  String? get validateEmail {
    if (this == null) return null;
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this!)) {
      return null;
    } else {
      return StringData.home;
    }
  }

  String get capitalizeFirstWord {
    if (this == null) return '';
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }
}
