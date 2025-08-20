import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

Center customLoading() {
  return Center(
    child: Lottie.asset(
      AppAssets.loading,
      width: 100.w,
      height: 100.h,
    ),
  );
}
