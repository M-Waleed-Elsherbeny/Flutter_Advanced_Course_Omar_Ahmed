import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_services.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/dio_handler.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/authentication_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/repo/login_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  // Dio And ApiServices
  Dio? dio = DioHandler.initialDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Login repositories And Cubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<AuthenticationCubit>(
      () => AuthenticationCubit(getIt()));
}
