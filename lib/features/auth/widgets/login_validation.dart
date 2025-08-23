import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/di/get_it_config.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/password_and_email_validations.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/custom_text_field.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/authentication_cubit.dart';

class LoginValidation extends StatelessWidget {
  const LoginValidation({
    super.key,
  });

  // bool hasUpperLetter = false;
  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = getIt<AuthenticationCubit>();
    return Form(
      key: cubit.loginFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: cubit.emailController,
            validator: (email) {
              if (email!.isEmpty) {
                return "Please enter your email";
              }
              if (!PasswordAndEmailValidations.isValidEmail(email: email)) {
                return "Please enter a valid email";
              }
              return null;
            },
            labelText: "Email",
          ),
          verticalSpace(33),
          CustomTextField(
            controller: cubit.passwordController,
            validator: (password) {
              if (password!.isEmpty) {
                return "Please enter your password";
              }
              if (!PasswordAndEmailValidations.isPasswordValid(password)) {
                return "Please enter a valid password";
              }
              return null;
            },
            isPassword: !cubit.showPassword,
            suffixIcon: IconButton(
              onPressed: () {
                cubit.showPassword = !cubit.showPassword;
              },
              icon: Icon(
                cubit.showPassword ? Icons.visibility : Icons.visibility_off,
                color: cubit.showPassword
                    ? AppColors.primaryColorBlue
                    : AppColors.textFormFieldColor,
              ),
            ),
            labelText: "Password",
          ),
          verticalSpace(15),
          // PasswordValidation(
          //   hasANumber: hasANumber,
          //   hasCharacterLength: hasCharacterLength,
          //   hasLowerLetter: hasLowerLetter,
          //   hasSpecialCharacter: hasSpecialCharacter,
          //   hasUpperLetter: hasUpperLetter,
          // ),
        ],
      ),
    );
  }
}
