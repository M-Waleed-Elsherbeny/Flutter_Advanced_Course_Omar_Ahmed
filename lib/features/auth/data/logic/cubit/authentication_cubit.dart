import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/models/login_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.loginRepo) : super(AuthenticationInitial());
  final LoginRepo loginRepo;
  LoginModel? loginModel;
  bool showPassword = false;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> login() async {
    emit(LoginLoading());
    try {
      Response response = await loginRepo.login(data: {
        "email": emailController.text,
        "password": passwordController.text,
      });
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        log(loginModel!.data!.token.toString());
        emit(LoginSuccess());
      }
    } catch (e) {
      log("Error in Login Cubit ====> $e");
      emit(LoginError(errorMessage: "Email Or Password Is Wrong"));
    }
  }
}
