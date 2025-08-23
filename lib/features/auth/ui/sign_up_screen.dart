import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/my_custom_button.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/already_have_account.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/sign_up_validation.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/signin_with_social_media.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(50),
                  Text(
                    "Create Account",
                    style: AppTextStyle.font32BoldPrimaryColor,
                  ),
                  verticalSpace(8),
                  Text(
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                    style: AppTextStyle.font13Grey400.copyWith(fontSize: 14.sp),
                  ),
                  verticalSpace(36),
                  const SignUpValidation(),
                  verticalSpace(33),
                  MyCustomButton(
                    onPressed: () {
                      //   AuthenticationCubit cubit =
                      //       getIt<AuthenticationCubit>();
                      //   if (cubit.formKey.currentState!.validate()) {
                      //     cubit.login();
                      //   }
                    },
                    text: "Create an account",
                  ),
                  verticalSpace(46),
                  const SignInWithSocialMedia(),
                  verticalSpace(24),
                  const AlreadyHaveAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
