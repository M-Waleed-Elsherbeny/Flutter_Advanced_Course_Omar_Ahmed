sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SpecializationLoading extends HomeState {}

final class SpecializationSuccess extends HomeState {}

final class SpecializationError extends HomeState {
  final String errorMessage;
  SpecializationError(this.errorMessage);
}

final class RefreshToken extends HomeState {}

final class GetSpecialtyDoctorsSuccess extends HomeState {}

final class GetSpecialtyDoctorsError extends HomeState {
  final String errorMessage;
  GetSpecialtyDoctorsError(this.errorMessage);
}
