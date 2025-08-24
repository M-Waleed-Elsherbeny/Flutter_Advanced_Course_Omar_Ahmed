import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/models/login_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final AuthRepo loginRepo;
  AuthModel? authModel;
  bool showPassword = false;

  
  Future<void> login({required String email, required String password,}) async {
    emit(LoginLoading());
    try {
      Response response = await loginRepo.login(data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        authModel = AuthModel.fromJson(response.data);
        log(authModel!.data!.token.toString());
        emit(LoginSuccess());
      }
    } catch (e) {
      log("Error in Login Cubit ====> $e");
      emit(LoginError(errorMessage: "Email Or Password Is Wrong"));
    }
  }
}
