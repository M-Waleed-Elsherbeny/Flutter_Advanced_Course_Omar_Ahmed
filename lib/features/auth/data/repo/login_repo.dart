import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_constants.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_services.dart';

class LoginRepo {
  final ApiServices apiServices;

  LoginRepo(this.apiServices);

  Future<Response> login({required Map<String, dynamic> data}) async {
    try {
      return await apiServices.post(
          endPoint: ApiConstants.loginPath, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
