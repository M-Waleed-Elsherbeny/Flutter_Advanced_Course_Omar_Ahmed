import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/my_custom_button.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/onboarding/view/widgets/doc_image_and_title.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/onboarding/view/widgets/doc_logo_and_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
        child: Column(
          children: [
            const DocLogoAndName(),
            verticalSpace(40),
            const DocImageAndTitle(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  Text(
                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                    style: AppTextStyle.font13Grey400,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(32),
                  MyCustomButton(
                    onPressed: () => context.go(AppRouter.loginScreen),
                    text: "Get Started",
                  ),
                ],
              ),
            )
          ],
        ),
      ))),
    );
  }
}
