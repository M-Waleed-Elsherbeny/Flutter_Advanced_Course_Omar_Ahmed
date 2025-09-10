import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_state.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/view/widgets/doctor_recommendation_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorBlocBuilderItems extends StatelessWidget {
  const DoctorBlocBuilderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      if (state is SpecializationError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage),
          ),
        );
      }
      if (state is RefreshToken) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("You Must Login Again"),
            backgroundColor: AppColors.errorColor,
          ),
        );
        context.pushReplacementNamed(AppRouter.loginScreen);
      }
    }, builder: (context, state) {
      if (state is SpecializationLoading) {
        return SizedBox(
          height: 100.h,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (state is SpecializationSuccess) {
        List<Doctor>? allDoctors =
            context.read<HomeCubit>().allDataList?.first.doctors;
        return Expanded(
          child: Column(
            children: [
              DoctorRecommendationListView(
                doctorModel: allDoctors,
              ),
            ],
          ),
        );
      } else if (state is GetSpecialtyDoctorsSuccess) {
        List<Doctor>? allDoctors = context.read<HomeCubit>().doctorList;
        return Expanded(
          child: Column(
            children: [
              DoctorRecommendationListView(
                doctorModel: allDoctors,
              ),
            ],
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
