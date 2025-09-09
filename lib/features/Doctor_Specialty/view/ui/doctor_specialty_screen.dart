import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/view/widgets/doctor_recommendation_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyScreen extends StatelessWidget {
  final List<Doctor>? doctorModel;
  const DoctorSpecialtyScreen({super.key, this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: 400.h,
      child: Column(
        children: [
          DoctorRecommendationListView(
            doctorModel: doctorModel,
          ),
        ],
      ),
    ));
  }
}
