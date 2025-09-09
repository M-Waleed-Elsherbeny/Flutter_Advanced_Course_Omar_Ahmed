import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/Constants/shared_pref_constants.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/extensions/string_extensions.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/shared_pref_helper.dart';
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
      String? userToken =
          await SharedPrefHelper.getSecuredData(SharedPrefConstants.userToken);
      if (!userToken.isNullOrEmpty()) {
        Response response = await loginRepo.login(
          data: {
            "email": loginEmailController.text,
            "password": loginPasswordController.text,
          },
          token: userToken,
        );
        if (response.statusCode == 200) {
          authModel = AuthModel.fromJson(response.data);

          emit(LoginSuccess());
        } else {
          emit(LoginError(errorMessage: "Something went wrong In Login"));
        }
      } else {
        emit(LoginError(errorMessage: "Something went wrong In Login"));
      }
    } catch (e) {
      log("Error in Login Cubit ====> $e");
      emit(LoginError(errorMessage: "Email Or Password Is Wrong"));
    }
  }
}
