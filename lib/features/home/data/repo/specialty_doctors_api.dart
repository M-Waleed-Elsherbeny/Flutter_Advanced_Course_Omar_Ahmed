import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_constants.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_services.dart';

class SpecialtyDoctorsRepo {
  final ApiServices apiServices;

  SpecialtyDoctorsRepo({required this.apiServices});
  
  Future<Response> getSpecialtyDoctors() async {
    try {
      Response response =  await apiServices.get(endPoint: ApiConstants.allSpecializationPath);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}