import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  static Future<String?> getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    return await messaging.getToken();
  }
}
