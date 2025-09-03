import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyListView extends StatelessWidget {
  const DoctorSpecialtyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: doctorSpecialtyItemsList.length,
        separatorBuilder: (context, index) => horizontalSpace(24),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.doctorSpecialtyItemsColor,
                child: Image.asset(
                  doctorSpecialtyItemsList[index].image,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
              Text(doctorSpecialtyItemsList[index].title,
                  style: AppTextStyle.font12Black400)
            ],
          );
        },
      ),
    );
  }
}
