import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/di/get_it_config.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/networking/bloc_observer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_route_config.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  // To Fix Texts That are hidden in flutter_screenutil library
  await ScreenUtil.ensureScreenSize();
  runApp(const DocApp());
}
// flutter run --release -t lib/main_production.dart --flavor production

class DocApp extends StatelessWidget {
  const DocApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          title: 'Doc App',
          routerConfig: AppRouteConfig.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primaryColorBlue,
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          ),
        );
      },
    );
  }
}
