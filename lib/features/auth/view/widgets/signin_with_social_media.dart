import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInWithSocialMedia extends StatelessWidget {
  const SignInWithSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100.w,
              child: const Divider(
                color: AppColors.borderColor,
              ),
            ),
            Text("Or sign in with", style: AppTextStyle.font13Grey400),
            SizedBox(
              width: 100.w,
              child: const Divider(
                color: AppColors.borderColor,
              ),
            ),
          ],
        ),
        verticalSpace(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                AppAssets.google,
                width: 40.w,
                height: 40.h,
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                AppAssets.facebook,
                width: 45.w,
                height: 45.h,
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                AppAssets.apple,
                width: 45.w,
                height: 45.h,
              ),
            ),
          ],
        ),
        verticalSpace(32),
        Center(
          child: SizedBox(
            width: 280.w,
            child: Text.rich(
              TextSpan(
                  text: "By logging, you agree to our ",
                  style: AppTextStyle.font13Grey400.copyWith(fontSize: 11.sp),
                  children: [
                    TextSpan(
                        text: " Terms & Conditions",
                        style: AppTextStyle.font11Black600),
                    TextSpan(
                      text: " and ",
                      style:
                          AppTextStyle.font13Grey400.copyWith(fontSize: 11.sp),
                    ),
                    TextSpan(
                        text: " PrivacyPolicy.",
                        style: AppTextStyle.font11Black600),
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
