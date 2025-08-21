import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/di/get_it_config.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/custom_loading.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/custom_snack_bar.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/my_custom_button.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/authentication_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/email_and_password_validation.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/signin_with_social_media.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginError) {
          customSnackBar(context, state.errorMessage);
        }
        if (state is LoginSuccess) {
          customSnackBar(
            context,
            "Login Successfully",
            backgroundColor: AppColors.successColor,
          );
          context.pushReplacementNamed(AppRouter.homeScreen);
        }
        if (state is LoginLoading) {
          customLoading(context);
        }
      },
      child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(50),
                          Text(
                            "Welcome Back",
                            style: AppTextStyle.font32BoldPrimaryColor,
                          ),
                          verticalSpace(8),
                          Text(
                            "We're excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.",
                            style: AppTextStyle.font13Grey400
                                .copyWith(fontSize: 14.sp),
                          ),
                          verticalSpace(36),
                          const EmailAndPasswordValidation(),
                          verticalSpace(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Spacer(),
                              TextButton(
                                child: Text(
                                  "Forgot Password?",
                                  style: AppTextStyle.font13primaryColor400
                                      .copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.5,
                                    decorationColor: AppColors.primaryColorBlue,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          verticalSpace(33),
                          MyCustomButton(
                            onPressed: () {
                              AuthenticationCubit cubit =
                                  getIt<AuthenticationCubit>();
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.login(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: "Login",
                          ),
                          verticalSpace(46),
                          const SignInWithSocialMedia(),
                          verticalSpace(24),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                  text: "Already have an account yet? ",
                                  style: AppTextStyle.font11Black600
                                      .copyWith(fontWeight: FontWeight.normal),
                                  children: [
                                    TextSpan(
                                        text: "Sign up",
                                        style: AppTextStyle
                                            .font13primaryColor400
                                            .copyWith(
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 1.5,
                                          decorationColor:
                                              AppColors.primaryColorBlue,
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
        ),
    );
  }
}
