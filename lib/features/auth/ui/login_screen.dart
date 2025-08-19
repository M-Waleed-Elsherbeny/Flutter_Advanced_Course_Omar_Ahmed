import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/custom_text_feild.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/height_spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/my_custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(
                  height: 50,
                ),
                Text(
                  "Welcome Back",
                  style: AppTextStyle.font32BoldPrimaryColor,
                ),
                const HeightSpacer(
                  height: 8,
                ),
                Text(
                  "We're excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.",
                  style: AppTextStyle.font13Grey400.copyWith(fontSize: 14.sp),
                ),
                const HeightSpacer(
                  height: 36,
                ),
                const CustomTextField(
                  labelText: "Email",
                ),
                const HeightSpacer(
                  height: 33,
                ),
                const CustomTextField(
                  labelText: "Password",
                ),
                const HeightSpacer(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          side: BorderSide(
                              color: AppColors.textFormFieldColor, width: 2.w),
                          value: false,
                          onChanged: (value) {},
                          activeColor: AppColors.primaryColorBlue,
                          checkColor: Colors.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        Text("Remember me", style: AppTextStyle.font13Grey400),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyle.font13primaryColor400.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.5,
                            decorationColor: AppColors.primaryColorBlue),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const HeightSpacer(
                  height: 33,
                ),
                MyCustomButton(
                  onPressed: () {},
                  text: "Login",
                ),
                const HeightSpacer(
                  height: 46,
                ),
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
                const HeightSpacer(
                  height: 32,
                ),
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
                const HeightSpacer(
                  height: 32,
                ),
                Center(
                  child: SizedBox(
                    width: 280.w,
                    child: Text.rich(
                      TextSpan(
                          text: "By logging, you agree to our ",
                          style: AppTextStyle.font13Grey400
                              .copyWith(fontSize: 11.sp),
                          children: [
                            TextSpan(
                                text: " Terms & Conditions",
                                style: AppTextStyle.font11Black600),
                            TextSpan(
                              text: " and ",
                              style: AppTextStyle.font13Grey400
                                  .copyWith(fontSize: 11.sp),
                            ),
                            TextSpan(
                                text: " PrivacyPolicy.",
                                style: AppTextStyle.font11Black600),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const HeightSpacer(height: 24),
                Center(
                  child: Text.rich(
                    TextSpan(
                        text: "Already have an account yet? ",
                        style: AppTextStyle.font11Black600
                            .copyWith(fontWeight: FontWeight.normal),
                        children: [
                          TextSpan(
                              text: "Sign up",
                              style:
                                  AppTextStyle.font13primaryColor400.copyWith(
                                decoration: TextDecoration.underline,
                                decorationThickness: 1.5,
                                decorationColor: AppColors.primaryColorBlue,
                              )),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
