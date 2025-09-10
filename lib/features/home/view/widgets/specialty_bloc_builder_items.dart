import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/style/colors/app_colors.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_state.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/view/widgets/specialty_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SpecialtyBlocBuilderItems extends StatelessWidget {
  const SpecialtyBlocBuilderItems({super.key});

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
      // if (state is SpecializationSuccess) {
      List<Data>? allData = context.read<HomeCubit>().allDataList;
      int index = allData?.length ?? 0;
      return Column(
        children: [
          SpecialtyListView(
            specialtyData: allData,
            index: index,
          ),
        ],
      );
    });
  }
}
