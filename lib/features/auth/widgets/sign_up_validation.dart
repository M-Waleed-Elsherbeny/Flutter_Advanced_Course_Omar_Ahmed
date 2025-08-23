import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/di/get_it_config.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/password_and_email_validations.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/custom_text_field.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/authentication_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/password_validation.dart';

class SignUpValidation extends StatefulWidget {
  const SignUpValidation({super.key});

  @override
  State<SignUpValidation> createState() => _SignUpValidationState();
}

class _SignUpValidationState extends State<SignUpValidation> {
  bool isPassword = false;
  bool isConfirmPassword = false;
  AuthenticationCubit cubit = getIt<AuthenticationCubit>();
  bool hasUpperLetter = false;
  bool hasLowerLetter = false;
  bool hasANumber = false;
  bool hasSpecialCharacter = false;
  bool hasCharacterLength = false;
  bool hasMatchedPassword = false;

  @override
  void initState() {
    cubit.passwordController.addListener(() {
      setState(() {
        hasUpperLetter = PasswordAndEmailValidations.hasUpperLetter(
          cubit.passwordController.text,
        );
        hasLowerLetter = PasswordAndEmailValidations.hasLowerLetter(
          cubit.passwordController.text,
        );
        hasANumber = PasswordAndEmailValidations.hasANumber(
          cubit.passwordController.text,
        );
        hasSpecialCharacter = PasswordAndEmailValidations.hasSpecialCharacter(
          cubit.passwordController.text,
        );
        hasCharacterLength = PasswordAndEmailValidations.hasMinimumLength(
          cubit.passwordController.text,
        );
        hasMatchedPassword = PasswordAndEmailValidations.hasMatchedPassword(
          cubit.passwordController.text,
          cubit.confirmPasswordController.text,
        );
      });
    });
    cubit.confirmPasswordController.addListener(() {
      setState(() {
        hasMatchedPassword = PasswordAndEmailValidations.hasMatchedPassword(
          cubit.passwordController.text,
          cubit.confirmPasswordController.text,
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.signUpFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: cubit.userNameController,
            validator: (userName) {
              if (userName!.isEmpty) {
                return "Please enter your Name";
              }
              return null;
            },
            labelText: "Username",
          ),
          verticalSpace(15),
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
          verticalSpace(15),
          CustomTextField(
            controller: cubit.phoneController,
            validator: (phonNumber) {
              if (phonNumber!.isEmpty) {
                return "Please enter your Phone Number";
              }
              if (!PasswordAndEmailValidations.hasAValidPhoneNumber(
                  phonNumber)) {
                return "Please enter a valid Phone Number";
              }
              return null;
            },
            labelText: "Phone Number",
          ),
          verticalSpace(15),
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
          CustomTextField(
            controller: cubit.confirmPasswordController,
            validator: (confirmPassword) {
              if (confirmPassword!.isEmpty) {
                return "Please enter your Confirm Password";
              }
              if (!PasswordAndEmailValidations.hasMatchedPassword(
                cubit.passwordController.text,
                confirmPassword,
              )) {
                return "Please enter a valid Confirm Password";
              }
              return null;
            },
            isPassword: !isConfirmPassword,
            suffixIcon: IconButton(
              onPressed: () {
                isConfirmPassword = !isConfirmPassword;
                setState(() {});
              },
              icon: Icon(
                isConfirmPassword ? Icons.visibility : Icons.visibility_off,
                color: isConfirmPassword
                    ? AppColors.primaryColorBlue
                    : AppColors.textFormFieldColor,
              ),
            ),
            labelText: "Confirm Password",
          ),
          verticalSpace(15),
          PasswordValidation(
            hasANumber: hasANumber,
            hasCharacterLength: hasCharacterLength,
            hasLowerLetter: hasLowerLetter,
            hasSpecialCharacter: hasSpecialCharacter,
            hasUpperLetter: hasUpperLetter,
            isSignUpScreen: true,
            hasMatchedPassword: hasMatchedPassword,
          ),
        ],
      ),
    );
  }
}
