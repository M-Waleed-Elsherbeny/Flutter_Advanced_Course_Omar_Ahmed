import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyListView extends StatelessWidget {
  const DoctorSpecialtyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => horizontalSpace(8.w),
        itemBuilder: (context, index) => Container(
          width: 100.w,
        ),
      ),
    );
  }
}
