import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/dio_handler.dart';

class ApiServices {
  static Dio? dio = DioHandler.initialDio();
  Future<Response> get({required String endPoint}) async {
    return await dio!.get(endPoint);
  }

  Future<Response> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    return await dio!.post(endPoint, data: data);
  }
}
