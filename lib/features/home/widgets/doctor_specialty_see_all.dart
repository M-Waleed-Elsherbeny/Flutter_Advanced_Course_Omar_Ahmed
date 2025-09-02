import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';

class DoctorSpecialtySeeAll extends StatelessWidget {
  const DoctorSpecialtySeeAll({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Doctor Specialties", style: AppTextStyle.font18BlackBold),
        const Spacer(),
        TextButton(
          onPressed: onPressed ?? () {},
          child: Text(
            "See All",
            style: AppTextStyle.font13PrimaryColor400,
          ),
        ),
      ],
    );
  }
}
