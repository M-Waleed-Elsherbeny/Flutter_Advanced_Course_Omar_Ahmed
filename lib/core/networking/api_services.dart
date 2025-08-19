import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  static Dio? dio;
  Dio? initialDio() {
    final Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiConstants.baseUrl;
      dio!.options.connectTimeout = timeout;
      dio!.options.receiveTimeout = timeout;
      prettyDioLogger();
      return dio;
    } else {
      return dio;
    }
  }

  static void prettyDioLogger() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  Future<Response> get({required String endPoint}) async {
    return await dio!.get(endPoint);
  }

  Future<Response> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    return await dio!.post(endPoint, data: data);
  }
}
