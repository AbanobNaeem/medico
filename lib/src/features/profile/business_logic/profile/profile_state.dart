part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.getDoctorProfile({required ProfileModel model}) = _GetDoctorProfile;
  const factory ProfileState.getUserProfile({required ProfileModel model}) = _GetUserProfile;
  const factory ProfileState.getNurseProfile({required ProfileModel model}) = _GetNurseProfile;

  const factory ProfileState.doctorProfileError({required String error}) = _DoctorProfileError;
  const factory ProfileState.userProfileError({required String error}) = _UserProfileError;
  const factory ProfileState.nurseProfileError({required String error}) = _NurseProfileError;
}
