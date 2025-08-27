import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_constants.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_services.dart';

class AuthRepo {
  final ApiServices apiServices;

  AuthRepo(this.apiServices);

  Future<Response> login({required Map<String, dynamic> data}) async {
    try {
      return await apiServices.post(
          endPoint: ApiConstants.loginPath, data: data);
    } catch (e) {
      rethrow;
    }
  }
  Future<Response> createNewUser({required Map<String, dynamic> data}) async {
    try {
      return await apiServices.post(
          endPoint: ApiConstants.registerPath, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
