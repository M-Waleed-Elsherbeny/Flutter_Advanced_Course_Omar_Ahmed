import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/di/get_it_config.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/data/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/ui/login_screen.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/ui/sign_up_screen.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/ui/home_screen.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouteConfig {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.homeScreen,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouter.onboardingScreen,
        name: AppRouter.onboardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: AppRouter.loginScreen,
        name: AppRouter.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRouter.signUpScreen,
        name: AppRouter.signUpScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRouter.homeScreen,
        name: AppRouter.homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<HomeCubit>()..getSpecialtyDoctors(),
            child: const HomeScreen(),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('No route defined for ${state.fullPath}')),
    ),
  );
}
