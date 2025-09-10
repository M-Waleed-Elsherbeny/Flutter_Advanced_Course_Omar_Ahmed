import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorRecommendationListView extends StatelessWidget {
  final List<Doctor>? doctorModel;
  final int? index;
  const DoctorRecommendationListView({
    super.key,
    this.doctorModel,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorModel?.length ?? 0,
        itemBuilder: (context, index) {
          log(doctorModel?.length.toString() ?? "");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: Image.asset(
                      AppAssets.recommendedDocImage,
                      width: 110.w,
                    ),
                  ),
                  horizontalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorModel?[index].name ?? "No Name",
                        
                        style: AppTextStyle.font16BlueBlack700,
                      ),
                      verticalSpace(8),
                      Text(
                        "${doctorModel?[index].degree ?? "No Degree"} | ${doctorModel?[index].specialization.name ?? "No Specialization"}",
                        style: AppTextStyle.font12Grey500,
                      ),
                      verticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppAssets.reviewStar),
                          horizontalSpace(5),
                          Text(
                            doctorModel?[index].email ??
                                "No Email",
                            style: AppTextStyle.font12Grey500,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              verticalSpace(24),
            ],
          );
        },
      ),
    );
  }
}
