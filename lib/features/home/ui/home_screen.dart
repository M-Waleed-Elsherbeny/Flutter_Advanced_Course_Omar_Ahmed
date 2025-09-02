import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/doctor_specialty_list_view.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/doctor_specialty_see_all.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/home_blue_container.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/home_tob_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 16.h,
            left: 20.w,
            right: 20.w,
            bottom: 28.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HomeTobAppBar(),
              const HomeBlueContainer(),
              verticalSpace(24),
              const DoctorSpecialtySeeAll(),
              verticalSpace(16),
              const DoctorSpecialtyListView(),
            ],
          ),
        ),
      ),
    );
  }
}
