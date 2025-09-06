import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/password_and_email_validations.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/custom_text_field.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/forgot_password.dart';

class LoginValidation extends StatelessWidget {
  const LoginValidation({
    super.key,
    this.onPasswordPressed,
    this.emailController, 
    this.passwordController, 
    this.isPassword = false,
  });
  final VoidCallback? onPasswordPressed;
  final TextEditingController? emailController, passwordController;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
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
          controller: passwordController,
          validator: (password) {
            if (password!.isEmpty) {
              return "Please enter your password";
            }
            // if (!PasswordAndEmailValidations.isPasswordValid(password)) {
            //   return "Please enter a valid password";
            // }
            return null;
          },
          isPassword: !isPassword,
          suffixIcon: IconButton(
            onPressed: onPasswordPressed,
            icon: Icon(
              isPassword ? Icons.visibility : Icons.visibility_off,
              color: isPassword
                  ? AppColors.primaryColorBlue
                  : AppColors.textFormFieldColor,
            ),
          ),
          labelText: "Password",
        ),
        // verticalSpace(15),
        // PasswordValidation(
        //   hasANumber: hasANumber,
        //   hasCharacterLength: hasCharacterLength,
        //   hasLowerLetter: hasLowerLetter,
        //   hasSpecialCharacter: hasSpecialCharacter,
        //   hasUpperLetter: hasUpperLetter,
        // ),
        verticalSpace(16),
        const ForgotPassword(),
        verticalSpace(30),
      ],
    );
  }
}
