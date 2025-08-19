import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/auth/ui/login_screen.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/onboarding/ui/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouteConfig {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.onboardingScreen,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouter.onboardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: AppRouter.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(child: Text('No route defined for ${state.fullPath}')),
        ),
  );
}
