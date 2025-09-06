import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/di/get_it_config.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/custom_loading.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/custom_snack_bar.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/my_custom_button.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/dont_have_an_account.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/login_validation.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/widgets/signin_with_social_media.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late LoginCubit loginCubit;
  @override
  void initState() {
    loginCubit = getIt<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginError ||
          current is LoginSuccess,
      listener: (context, state) {
        if (state is LoginLoading) {
          customLoading(context);
        }
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
                      "Welcome Back",
                      style: AppTextStyle.font32BoldPrimaryColor,
                    ),
                    verticalSpace(8),
                    Text(
                      "We're excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.",
                      style:
                          AppTextStyle.font13Grey400.copyWith(fontSize: 14.sp),
                    ),
                    verticalSpace(36),
                    Form(
                      key: loginFormKey,
                      child: LoginValidation(
                        emailController: loginCubit.loginEmailController,
                        passwordController: loginCubit.loginPasswordController,
                        isPassword: loginCubit.showPassword,
                        onPasswordPressed: () {
                          loginCubit.showPassword = !loginCubit.showPassword;
                          setState(() {});
                        },
                      ),
                    ),
                    MyCustomButton(
                      onPressed: () async {
                        if (loginFormKey.currentState!.validate()) {
                          await loginCubit.login();
                        }
                      },
                      text: "Login",
                    ),
                    verticalSpace(46),
                    const SignInWithSocialMedia(),
                    verticalSpace(24),
                    const DontHaveAnAccount()
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
