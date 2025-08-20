import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/custom_loading.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/custom_snack_bar.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/custom_text_field.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/widgets/my_custom_button.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/authentication_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/functions/validators.dart';
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
  bool isPassword = false;
  bool isCheck = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
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
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: state is LoginLoading
                ? customLoading()
                : SafeArea(
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
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: emailController,
                                  validator: (email) {
                                    log(email.toString());
                                    if (email!.isEmpty) {
                                      return "Please enter your email";
                                    }
                                    if (!isValidEmail(email: email)) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                  labelText: "Email",
                                ),
                                verticalSpace(33),
                                CustomTextField(
                                  controller: passwordController,
                                  validator: (password) {
                                    if (password!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    if (password.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                  isPassword: !isPassword,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      isPassword = !isPassword;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      isPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: isPassword
                                          ? AppColors.primaryColorBlue
                                          : AppColors.textFormFieldColor,
                                    ),
                                  ),
                                  labelText: "Password",
                                ),
                              ],
                            ),
                          ),
                          verticalSpace(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                side: BorderSide(
                                    color: AppColors.textFormFieldColor,
                                    width: 2.w),
                                value: isCheck,
                                onChanged: (value) {
                                  isCheck = !isCheck;
                                  setState(() {});
                                },
                                activeColor: AppColors.primaryColorBlue,
                                checkColor: Colors.white,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              Text("Remember me",
                                  style: AppTextStyle.font13Grey400),
                              const Spacer(),
                              TextButton(
                                child: Text(
                                  "Forgot Password?",
                                  style: AppTextStyle.font13primaryColor400
                                      .copyWith(
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 1.5,
                                          decorationColor:
                                              AppColors.primaryColorBlue),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          verticalSpace(33),
                          MyCustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.login(
                                    email: emailController.text,
                                    password: passwordController.text);
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
        );
      },
    );
  }
}
