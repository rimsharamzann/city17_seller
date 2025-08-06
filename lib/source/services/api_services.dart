import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum DioMethod { post, get, put, delete }

class APIService {
  APIService._singleton();

  static final APIService instance = APIService._singleton();

  String get baseUrl {
    if (kDebugMode) {
      return 'http://192.168.1.18:5000/api/v1';
    }

    return '';
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? bodyParams,
    String? contentType,
    formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers: {
            // HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      switch (method) {
        case DioMethod.post:
          return dio.post(endpoint, data: bodyParams ?? formData);
        case DioMethod.get:
          return dio.get(endpoint, queryParameters: bodyParams);
        case DioMethod.put:
          return dio.put(endpoint, data: bodyParams ?? formData);
        case DioMethod.delete:
          return dio.delete(endpoint, data: bodyParams ?? formData);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        rethrow;
      }
      throw Exception(e);
    }
  }
}
