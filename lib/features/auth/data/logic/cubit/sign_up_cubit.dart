import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/models/login_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.loginRepo) : super(SignUpInitial());
  final AuthRepo loginRepo;
  AuthModel? authModel;

  Future<void> signUp({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    try {
      Response response = await loginRepo.createNewUser(data: {
        "name": userName,
        "email": email,
        "phone": phone,
        "gender": "0",
        "password": password,
        "password_confirmation": confirmPassword
      });
      log(response.data.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        authModel = AuthModel.fromJson(response.data);
        log(authModel!.data!.token.toString());
        emit(SignUpSuccess());
      }
    } catch (e) {
      log("Error in SignUp Cubit ====> $e");
      emit(SignUpError(errorMessage: "Email Or Password Is Wrong"));
    }
  }
}
