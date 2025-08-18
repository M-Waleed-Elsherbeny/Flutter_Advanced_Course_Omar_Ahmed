import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/custom_text_feild.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/height_spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/my_custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                        style: AppTextStyle.font14primaryColor400,
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
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
