import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHandler {
  static Dio? dio;
  static Dio? initialDio() {
    final Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiConstants.baseUrl;
      dio!.options.connectTimeout = timeout;
      dio!.options.receiveTimeout = timeout;
      addingHeaders();
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

  static void addingHeaders() {
    dio!.options.headers = {
      "Accept": "application/json",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzU3MTQ5ODg5LCJleHAiOjE3NTcyMzYyODksIm5iZiI6MTc1NzE0OTg4OSwianRpIjoiY0VNQjhGTnB4b2xtQ01EWSIsInN1YiI6IjI4MCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.bFk7rq0Z0a9I-tC6YG0KL13GPDHkP-Rok0il5hDdlDc",
    };
  }
}
