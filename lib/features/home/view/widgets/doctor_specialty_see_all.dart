import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';

class DoctorSectionWithSeeAll extends StatelessWidget {
  const DoctorSectionWithSeeAll({super.key, this.onPressed, required this.sectionTitle});
  final VoidCallback? onPressed;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(sectionTitle, style: AppTextStyle.font18BlackBold),
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
