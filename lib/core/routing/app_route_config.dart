import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/onboarding/onboarding_screen.dart';
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
      // GoRoute(
      //   path: 'details',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const DetailsScreen();
      //   },
      // ),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(child: Text('No route defined for ${state.fullPath}')),
        ),
  );
}
