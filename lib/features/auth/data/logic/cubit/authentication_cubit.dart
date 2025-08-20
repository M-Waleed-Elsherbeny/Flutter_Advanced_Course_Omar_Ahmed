import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/api_services.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/models/login_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  LoginRepo loginRepo = LoginRepo(ApiServices());
  LoginModel? loginModel;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      Response response =
          await loginRepo.login(data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        
        log(loginModel!.data!.token.toString());
        emit(LoginSuccess());
      }
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }
}
