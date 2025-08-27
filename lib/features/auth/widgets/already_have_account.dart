import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account!!!",
            style: AppTextStyle.font11Black600
                .copyWith(fontWeight: FontWeight.normal),
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              "Login",
              style: AppTextStyle.font13primaryColor400.copyWith(
                decoration: TextDecoration.underline,
                decorationThickness: 1.5,
                decorationColor: AppColors.primaryColorBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
