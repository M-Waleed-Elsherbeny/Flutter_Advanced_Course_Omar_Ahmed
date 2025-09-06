import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';

class HomeTobAppBar extends StatelessWidget {
  const HomeTobAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Omar!",
              style: AppTextStyle.font18BlackBold,
            ),
            Text(
              "How Are you Today?",
              style: AppTextStyle.font11Grey400,
            ),
          ],
        ),
        const Spacer(),
        Image.asset(AppAssets.alertNotification)
      ],
    );
  }
}
