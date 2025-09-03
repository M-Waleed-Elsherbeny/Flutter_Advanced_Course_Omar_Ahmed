import 'package:flutter_advanced_course_omar_ahmed/core/assets/app_assets.dart';

class DoctorSpecialtyItemsModel {
  final String image;
  final String title;

  DoctorSpecialtyItemsModel({
    required this.image,
    required this.title,
  });
}

List<DoctorSpecialtyItemsModel> doctorSpecialtyItemsList = [
  DoctorSpecialtyItemsModel(
    image: AppAssets.homeGeneral,
    title: "General",
  ),
  DoctorSpecialtyItemsModel(
    image: AppAssets.homeNeurologic,
    title: "Neurologic",
  ),
  DoctorSpecialtyItemsModel(
    image: AppAssets.homePediatric,
    title: "Pediatric",
  ),
  DoctorSpecialtyItemsModel(
    image: AppAssets.homeRadiology,
    title: "Radiology",
  ),
];
