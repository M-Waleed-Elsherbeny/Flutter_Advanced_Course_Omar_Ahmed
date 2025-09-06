import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/helper/spacer.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_state.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/doctor_recommendation_list_view.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/doctor_specialty_list_view.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/doctor_specialty_see_all.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/home_blue_container.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/widgets/home_tob_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 16.h,
            left: 20.w,
            right: 20.w,
            bottom: 28.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HomeTobAppBar(),
              const HomeBlueContainer(),
              verticalSpace(24),
              const DoctorSectionWithSeeAll(
                sectionTitle: "Doctor Specialties",
              ),
              BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                if (state is SpecializationLoading) {
                  return SizedBox(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is SpecializationError) {
                  return Text(state.message);
                }
                if (state is SpecializationSuccess) {
                  List<Data> data = state.doctorSpecializationDataModel.allData;
                  int index = data.length - 1;
                  return Expanded(
                    child: Column(
                      children: [
                        DoctorSpecialtyListView(
                          doctorSpecialtyData: data,
                        ),
                        const DoctorSectionWithSeeAll(
                          sectionTitle: "Recommendation Doctor",
                        ),
                        DoctorRecommendationListView(
                          doctorModel: data[index].doctors,
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
