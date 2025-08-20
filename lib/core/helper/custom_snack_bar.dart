import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';

void customSnackBar(BuildContext context, String errorMessage,
    {Color backgroundColor = AppColors.errorColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(errorMessage), backgroundColor: backgroundColor),
  );
}
