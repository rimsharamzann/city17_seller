import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceInfoUtils {
  static Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor ?? "UnknownIOSId";
    } else {
      return "UnsupportedPlatform";
    }
  }
}
