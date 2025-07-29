import 'package:city17_seller/source/constants/string_data.dart';

 enum ScreenType { fixed, mobile }
 extension ScreenTypeExtension on ScreenType {
  String get title {
    switch (this) {
      case ScreenType.fixed:
        return StringData.fixed;
      case ScreenType.mobile:
        return StringData.mobile;
      
    }
  }
}


enum LocationType { shop, restaurant, vehicle, other }

extension LocationTypeExtension on LocationType {
  String get title {
    switch (this) {
      case LocationType.shop:
        return StringData.shop;
      case LocationType.restaurant:
        return StringData.restaurant;
      case LocationType.vehicle:
        return StringData.vehicle;
      case LocationType.other:
        return StringData.other;
    }
  }
}

enum Placement { facingOutside, insideTheProperty }
 extension Extension on Placement {
  String get title {
    switch (this) {
      case Placement.facingOutside:
        return StringData.facingOutside;
      case Placement.insideTheProperty:
        return StringData.insideTheProperty;
      
    }
  }
}


enum ScreenOrientation { horizontal, vertical }
 extension ScreenOrientationExtension on ScreenOrientation {
  String get title {
    switch (this) {
      case ScreenOrientation.horizontal:
        return StringData.horizontal;
      case ScreenOrientation.vertical:
        return StringData.vertical;
     
    }
  }
}

