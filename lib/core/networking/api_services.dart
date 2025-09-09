import 'package:dio/dio.dart';

class ApiServices {
  Dio? dio;
  ApiServices(this.dio);
  Future<Response> get(
      {required String endPoint, Map<String, dynamic>? headers}) async {
    return await dio!.get(
      endPoint,
      options: Options(
        headers: headers ?? {},
      ),
    );
  }

  Future<Response> post(
      {required String endPoint,
      required Map<String, dynamic> data,
      Map<String, dynamic>? headers}) async {
    return await dio!.post(
      endPoint,
      data: data,
      options: Options(
        headers: headers ?? {},
      ),
    );
  }
}
