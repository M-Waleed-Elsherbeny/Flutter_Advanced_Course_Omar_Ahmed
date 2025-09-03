import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_state.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/repo/specialty_doctors_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._specialtyDoctorsRepo) : super(HomeInitial());
  final SpecialtyDoctorsRepo _specialtyDoctorsRepo;

  Future<void> getSpecialtyDoctors() async {
    emit(SpecializationLoading());
    try {
      final response = await _specialtyDoctorsRepo.getSpecialtyDoctors();
      if (response.statusCode == 200) {
        emit(SpecializationSuccess(response.data));
      }
    } catch (e) {
      emit(SpecializationError(e.toString()));
    }
  }
}
