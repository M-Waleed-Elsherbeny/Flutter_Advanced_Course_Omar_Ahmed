import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/custom_loading.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/custom_snack_bar.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/view/widgets/already_have_account.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/view/widgets/sign_up_validation.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/view/widgets/signin_with_social_media.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          customLoading(context);
        }
        if (state is SignUpError) {
          context.pop();
          customSnackBar(context, state.errorMessage);
        }
        if (state is SignUpSuccess) {
          context.pop();
          customSnackBar(
            context,
            "Sign Up Successfully",
            backgroundColor: AppColors.successColor,
          );
          context.pop();
        }
      },
      child: Scaffold(
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
                      style:
                          AppTextStyle.font13Grey400.copyWith(fontSize: 14.sp),
                    ),
                    verticalSpace(36),
                    const SignUpValidation(),
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
      ),
    );
  }
}
