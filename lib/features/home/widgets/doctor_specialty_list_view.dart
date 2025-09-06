import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyListView extends StatelessWidget {
  final List<Data>? doctorSpecialtyData;
  const DoctorSpecialtyListView({super.key, this.doctorSpecialtyData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount:
            doctorSpecialtyData?.length ?? doctorSpecialtyItemsList.length,
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
                  AppAssets.homeNeurologic,
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                doctorSpecialtyData?[index].name ??
                    doctorSpecialtyItemsList[index].title,
                style: AppTextStyle.font12Black400,
              )
            ],
          );
        },
      ),
    );
  }
}
