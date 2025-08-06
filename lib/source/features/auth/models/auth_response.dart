
import 'dart:convert';

import 'package:city17_seller/source/features/auth/models/user_model.dart';
import 'package:city17_seller/source/services/api_services.dart';
import 'package:city17_seller/source/services/push_notifications.dart';
import 'package:city17_seller/utils/device_info_utils.dart';

class AuthResponse {
  AuthResponse({
    required this.token,
    required this.user,
  });
  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AuthResponse.fromMap(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      user: UserModel.fromMap(json['user']),
    
    );
  }
   

  final String token;
  final UserModel user;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'user': user.toMap(),
    };
  }

  AuthResponse copyWith({
    String? token,
    UserModel? user,
  }) {
    return AuthResponse(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  String toJson() => json.encode(toMap());

    Future login(String firebaseToken) async {
    final fcm = await PushNotifications.getToken();
    final deviceId = await DeviceInfoUtils.getDeviceId();
    return await APIService.instance.request(
      '/auth/google',
      DioMethod.post,
      bodyParams: {
        'idToken': firebaseToken,
        if (fcm != null) 'fcm': fcm,
        'deviceId': deviceId,
      },
    );
  }
}
 