import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorRecommendationListView extends StatelessWidget {
  const DoctorRecommendationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Image.asset(AppAssets.recommendedDocImage,
                          width: 110.w)),
                  horizontalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Mohammed Waleed",
                        style: AppTextStyle.font16BlueBlack700,
                      ),
                      verticalSpace(8),
                      Text(
                        "General | RSUD Gatot Subroto",
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
                            "4.8 (4,279 reviews)",
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
