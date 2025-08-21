import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.hasUpperLetter,
    required this.hasLowerLetter,
    required this.hasANumber,
    required this.hasSpecialCharacter,
    required this.hasCharacterLength,
  });

  final bool hasUpperLetter;
  final bool hasLowerLetter;
  final bool hasANumber;
  final bool hasSpecialCharacter;
  final bool hasCharacterLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRowPasswordValidation("At Least 1 Number", hasANumber),
        buildRowPasswordValidation("At Least 8 Characters", hasCharacterLength),
        buildRowPasswordValidation(
            "At Least 1 Lowercase Letter", hasLowerLetter),
        buildRowPasswordValidation(
            "At Least 1 Special Character", hasSpecialCharacter),
        buildRowPasswordValidation(
            "At Least 1 Uppercase Letter", hasUpperLetter),
      ],
    );
  }
}

Row buildRowPasswordValidation(String text, bool hasValidation) {
  return Row(
    children: [
      CircleAvatar(
        backgroundColor: AppColors.blackColor,
        radius: 3.w,
      ),
      horizontalSpace(8.w),
      Text(
        text,
        style: AppTextStyle.font11Black600.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          decoration: hasValidation ? TextDecoration.lineThrough : null,
          decorationColor: hasValidation ? AppColors.successColor : null,
          decorationThickness: hasValidation ? 2.w : null,
        ),
      ),
    ],
  );
}
