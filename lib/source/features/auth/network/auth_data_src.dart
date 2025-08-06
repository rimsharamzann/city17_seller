import 'package:city17_seller/source/services/api_services.dart';
import 'package:city17_seller/source/services/push_notifications.dart';
import 'package:city17_seller/utils/device_info_utils.dart';

// in this auth data source we first ddefine paths here (end poins here)



class AuthDataSrc {
  Future getUser() async {
    return await APIService.instance.request('/City17/auth', DioMethod.get);
  }
  // login with email and password end points

  Future loginWithEmailPassword(String email, String password) async {
    return await APIService.instance.request(
      '/Auth/login',
      DioMethod.post,
      bodyParams: {'email': email, 'password': password},
    );
  }

  // 1.register path 
  Future register(String userName, String email, String password) async {
    return await APIService.instance.request(
      '/Auth/register',
      DioMethod.post,
      bodyParams: {'email': email, 'password': password},
    );
  }

  Future authProfile() async {
    return await APIService.instance.request('/Auth/profile', DioMethod.get);
  }

  Future login(String firebaseToken) async {
    final fcm = await PushNotifications.getToken();
    final deviceId = await DeviceInfoUtils.getDeviceId();
    return await APIService.instance.request(
      '/Auth/google',
      DioMethod.post,
      bodyParams: {
        'idToken': firebaseToken,
        if (fcm != null) 'fcm': fcm,
        'deviceId': deviceId,
      },
    );
  }
}
