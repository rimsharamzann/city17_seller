import 'dart:async';

import 'package:city17_seller/source/core/extensions/my_exception.dart';
import 'package:city17_seller/source/features/auth/models/auth_response.dart';
import 'package:city17_seller/source/features/auth/models/user_model.dart';
import 'package:city17_seller/source/features/auth/network/auth_data_src.dart';

// In auth repo or any repo file we get responses coming from data src file / emd points

class AuthRepo {
  AuthRepo() {
    _dataSource = AuthDataSrc();
  }

  late AuthDataSrc _dataSource;

  //2. get response
  Future<AuthResponse> register(
    String userName,
    String email,
    String password,
  ) async {
    final res = await _dataSource.register(userName, email, password);
    if (res.data['success']) {
      return AuthResponse.fromMap(res.data['data']);
    }
    throw MyException(res.data['message']);
  }

  Future<AuthResponse> regis(
    String userName,
    String
    email,
    String password,
  ) async {
    final res = await _dataSource.register(userName, email, password);
    if (res.data['success']) {
      return AuthResponse.fromMap(res.data['data']);
    }
    throw MyException(res.data['message']);
  }

  Future<List<UserModel>> getUsers() async {
    final res = await _dataSource.getUser();
    print(res.data);

    if (res.data['success']) {
      return List.from(
        res.data['data']['auth'].map((e) => UserModel.fromMap(e)),
      );
    }
    throw MyException(res.data['message']);
  }

  Future<AuthResponse> loginWithEmailPassword(
    String email,
    String password,
  ) async {
    final res = await _dataSource.loginWithEmailPassword(email, password);
    if (res.data['success']) {
      return AuthResponse.fromMap(res.data['data']);
    }
    throw MyException(res.data['message']);
  }

  Future<AuthResponse> login(String authToken) async {
    final res = await _dataSource.login(authToken);
    if (res.data['success']) {
      return AuthResponse.fromMap(res.data['data']);
    }
    throw MyException(res.data['message']);
  }

  Future<AuthResponse> authProfile() async {
    final res = await _dataSource.authProfile();

    if (res.data['success']) {
      return AuthResponse.fromMap(res.data['data']);
    }
    throw MyException(res.data['message']);
  }
}




// abstract class _AuthRepo {
//   Future<AuthResponse> login(String authToken);
//   Future<AuthResponse> authProfile();
//   Future<AuthResponse> devAuth();
// }

// class AuthRepo implements _AuthRepo {
//   AuthRepo() {
//     _dataSrc = AuthDataSrc();
//   }
//   late AuthDataSrc _dataSrc;

//   @override
//   Future<AuthResponse> login(String authToken) async {
//     final res = await _dataSrc.login(authToken);
//     if (res.data['success']) {
//       return AuthResponse.fromMap(res.data['data']);
//     }
//     throw MyException(res.data['message']);
//   }

//   @override
//   Future<AuthResponse> authProfile() async {
//     final res = await _dataSrc.authProfile();

//     if (res.data['success']) {
//       return AuthResponse.fromMap(res.data['data']);
//     }
//     throw MyException(res.data['message']);
//   }

//   @override
//   Future<AuthResponse> devAuth() async {
//     final res = await _dataSrc.devAuth();
//     if (res.data['success']) {
//       return AuthResponse.fromMap(res.data['data']);
//     }
//     throw MyException(res.data['message']);
//   }
// }


  
