import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBlueContainer extends StatelessWidget {
  const HomeBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197.h,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 167.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.homeBackgroundBlueDoctor),
              ),
            ),
            padding: EdgeInsets.only(top: 12.h, left: 18.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: AppTextStyle.font18White500,
                ),
                verticalSpace(15),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Find Nearby",
                    style: AppTextStyle.font13PrimaryColor400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 15.w,
              bottom: 2.h,
              child: Image.asset(
                height: 197.h,
                AppAssets.homeDoctor,
              ))
        ],
      ),
    );
  }
}
