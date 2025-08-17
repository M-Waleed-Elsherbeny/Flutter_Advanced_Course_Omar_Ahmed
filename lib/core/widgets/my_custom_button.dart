import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({super.key, this.onPressed, this.text});
  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 52.h,
      color: AppColors.primaryColorBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      onPressed: onPressed,
      child: Text(
        text ?? "Type text here",
        style: AppTextStyle.font16White600,
      ),
    );
  }
}
