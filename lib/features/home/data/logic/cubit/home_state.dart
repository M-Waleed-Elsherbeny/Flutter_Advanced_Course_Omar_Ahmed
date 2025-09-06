import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SpecializationLoading extends HomeState {}

final class SpecializationSuccess extends HomeState {
  final DoctorSpecializationDataModel doctorSpecializationDataModel;
  SpecializationSuccess(this.doctorSpecializationDataModel);
}

final class SpecializationError extends HomeState {
  final String message;
  SpecializationError(this.message);
}
