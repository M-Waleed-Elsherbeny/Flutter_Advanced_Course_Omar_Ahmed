import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/models/login_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final AuthRepo loginRepo;
  AuthModel? authModel;
  bool showPassword = false;
    // login Controllers
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  
  Future<void> login() async {
    emit(LoginLoading());
    try {
      Response response = await loginRepo.login(data: {
        "email": loginEmailController.text,
        "password": loginPasswordController.text,
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
