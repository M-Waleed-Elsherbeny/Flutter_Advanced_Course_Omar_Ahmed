import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/Constants/api_constants.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/shared_pref_constants.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/extensions/string_extensions.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/shared_pref_helper.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_services.dart';

class SpecialtyDoctorsRepo {
  final ApiServices apiServices;

  SpecialtyDoctorsRepo({required this.apiServices});
  
  Future<Response> getSpecialtyDoctors() async {
    try {
      String? token = await SharedPrefHelper.getSecuredData(SharedPrefConstants.userToken);
      if (!token.isNullOrEmpty()) {
      Response response =  await apiServices.get(endPoint: ApiConstants.allSpecializationPath, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      });
      return response;
      } else {
        throw Exception("Token is null");
      }
    } catch (e) {
      rethrow;
    }
  }
}