import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/Constants/shared_pref_constants.dart';
import 'package:flutter_advanced_course_omar_ahmed/core/extensions/string_extensions.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/logic/cubit/home_state.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/models/doctor_specialty_data_model.dart';
import 'package:flutter_advanced_course_omar_ahmed/features/home/data/repo/specialty_doctors_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._specialtyDoctorsRepo) : super(HomeInitial());
  final SpecialtyDoctorsRepo _specialtyDoctorsRepo;

  List<Data>? allDataList = [];
  List<Doctor>? doctorList = [];

  Future<void> getSpecialtyDoctors() async {
    emit(SpecializationLoading());
    try {
      final response = await _specialtyDoctorsRepo.getSpecialtyDoctors();
      if (response.statusCode == 200) {
        allDataList =
            DoctorSpecializationDataModel.fromJson(response.data).allData;
        filterDoctorsBySpecialtyId(specialtyId: allDataList!.first.id);
        emit(SpecializationSuccess());
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        isUserLoggedIn = false;
        emit(RefreshToken());
      }
    } catch (e) {
      emit(SpecializationError(e.toString()));
    }
  }

  void filterDoctorsBySpecialtyId({required int specialtyId}) {
    doctorList = allDataList
            ?.firstWhere((element) => element.id == specialtyId)
            .doctors ??
        [];
    if (!doctorList.isNullOrEmpty()) {
      emit(GetSpecialtyDoctorsSuccess());
    } else {
      emit(GetSpecialtyDoctorsError("No doctors found"));
    }
  }
}
