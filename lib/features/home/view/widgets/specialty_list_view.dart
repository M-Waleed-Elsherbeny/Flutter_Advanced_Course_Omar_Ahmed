import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/fonts/app_text_style.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialtyListView extends StatefulWidget {
  final List<Data>? specialtyData;
  final int index;
  const SpecialtyListView({
    super.key,
    this.specialtyData,
    required this.index,
  });

  @override
  State<SpecialtyListView> createState() => _SpecialtyListViewState();
}

class _SpecialtyListViewState extends State<SpecialtyListView> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specialtyData?.length ?? 0,
        separatorBuilder: (context, index) => horizontalSpace(24),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
              if (currentIndex == index) {
                context
                    .read<HomeCubit>()
                    .filterDoctorsBySpecialtyId(specialtyId: currentIndex + 1);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: currentIndex == index
                          ? AppColors.primaryColorBlue
                          : Colors.transparent,
                      width: 2.w,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.doctorSpecialtyItemsColor,
                    child: Image.asset(
                      AppAssets.homeNeurologic,
                      width: currentIndex == index ? 40.w : 30.w,
                      height: currentIndex == index ? 40.h : 30.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  widget.specialtyData?[index].name ?? "No Name",
                  style: currentIndex == index
                      ? AppTextStyle.font16BlueBlack700
                      : AppTextStyle.font12Black400,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
