import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(),
        TextButton(
          child: Text(
            "Forgot Password?",
            style: AppTextStyle.font13PrimaryColor400.copyWith(
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
              decorationColor: AppColors.primaryColorBlue,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
