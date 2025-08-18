import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font24Black700 = TextStyle(
    color: Colors.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font32BoldPrimaryColor = TextStyle(
    color: AppColors.primaryColorBlue,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font13Grey400 = TextStyle(
    color: AppColors.secondaryColorGrey,
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle font16White600 = TextStyle(
    color: AppColors.scaffoldBackgroundColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}
