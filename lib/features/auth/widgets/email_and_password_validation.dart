import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/di/get_it_config.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/password_regex_valid.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/custom_text_field.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/authentication_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/functions/validators.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/password_validation.dart';

class EmailAndPasswordValidation extends StatefulWidget {
  const EmailAndPasswordValidation({super.key});

  @override
  State<EmailAndPasswordValidation> createState() =>
      _EmailAndPasswordValidationState();
}

class _EmailAndPasswordValidationState
    extends State<EmailAndPasswordValidation> {
  bool isPassword = false;
  AuthenticationCubit cubit = getIt<AuthenticationCubit>();
  bool hasUpperLetter = false;
  bool hasLowerLetter = false;
  bool hasANumber = false;
  bool hasSpecialCharacter = false;
  bool hasCharacterLength = false;

  @override
  void initState() {
    cubit.passwordController.addListener(() {
      setState(() {
        hasUpperLetter = PasswordRegexValid.hasUpperLetter(
          cubit.passwordController.text,
        );
        hasLowerLetter = PasswordRegexValid.hasLowerLetter(
          cubit.passwordController.text,
        );
        hasANumber = PasswordRegexValid.hasANumber(
          cubit.passwordController.text,
        );
        hasSpecialCharacter = PasswordRegexValid.hasSpecialCharacter(
          cubit.passwordController.text,
        );
        hasCharacterLength = PasswordRegexValid.hasMinimumLength(
          cubit.passwordController.text,
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: cubit.emailController,
            validator: (email) {
              if (email!.isEmpty) {
                return "Please enter your email";
              }
              if (!isValidEmail(email: email)) {
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
              if (!PasswordRegexValid.isPasswordValid(password)) {
                return "Please enter a valid password";
              }
              return null;
            },
            isPassword: !isPassword,
            suffixIcon: IconButton(
              onPressed: () {
                isPassword = !isPassword;
                setState(() {});
              },
              icon: Icon(
                isPassword ? Icons.visibility : Icons.visibility_off,
                color: isPassword
                    ? AppColors.primaryColorBlue
                    : AppColors.textFormFieldColor,
              ),
            ),
            labelText: "Password",
          ),
          verticalSpace(15),
          PasswordValidation(
            hasANumber: hasANumber,
            hasCharacterLength: hasCharacterLength,
            hasLowerLetter: hasLowerLetter,
            hasSpecialCharacter: hasSpecialCharacter,
            hasUpperLetter: hasUpperLetter,
          ),
        ],
      ),
    );
  }
}
