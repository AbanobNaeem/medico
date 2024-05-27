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

  const factory ProfileState.addImageLoading() = _AddImageLoading;
  const factory ProfileState.addImageError({required String error}) = _AddImageError;
  const factory ProfileState.addImageSuccess({required MapModel model}) = _AddImageSuccess;

  const factory ProfileState.updateDoctorUsernameSuccess({required PutModel model}) = _UpdateDoctorUsernameSuccess;
  const factory ProfileState.updateDoctorUsernameError({required String error}) = _UpdateDoctorUsernameError;

  const factory ProfileState.updateDoctorSpecialitySuccess({required PutModel model}) = _UpdateDoctorSpecialitySuccess;
  const factory ProfileState.updateDoctorSpecialityError({required String error}) = _UpdateDoctorSpecialityError;

  const factory ProfileState.updateDoctorPhoneNumSuccess({required PutModel model}) = _UpdateDoctorPhoneNumSuccess;
  const factory ProfileState.updateDoctorPhoneNumError({required String error}) = _UpdateDoctorPhoneNumError;

  const factory ProfileState.updateDoctorWorkTimeSuccess({required PutModel model}) = _UpdateDoctorWorkTimeSuccess;
  const factory ProfileState.updateDoctorWorkTimeError({required String error}) = _UpdateDoctorWorkTimeError;

  const factory ProfileState.updateDoctorAddressSuccess({required PutModel model}) = _UpdateDoctorAddressSuccess;
  const factory ProfileState.updateDoctorAddressError({required String error}) = _UpdateDoctorAddressError;

  const factory ProfileState.updateDoctorDescriptionSuccess({required PutModel model}) = _UpdateDoctorDescriptionSuccess;
  const factory ProfileState.updateDoctorDescriptionError({required String error}) = _UpdateDoctorDescriptionError;

  const factory ProfileState.updateDoctorGovernoratesSuccess({required PutModel model}) = _UpdateDoctorGovernoratesSuccess;
  const factory ProfileState.updateDoctorGovernoratesError({required String error}) = _UpdateDoctorGovernoratesError;

  const factory ProfileState.updateNurseUsernameSuccess({required PutModel model}) = _UpdateNurseUsernameSuccess;
  const factory ProfileState.updateNurseUsernameError({required String error}) = _UpdateNurseUsernameError;

  const factory ProfileState.updateNurseSpecialitySuccess({required PutModel model}) = _UpdateNurseSpecialitySuccess;
  const factory ProfileState.updateNurseSpecialityError({required String error}) = _UpdateNurseSpecialityError;

  const factory ProfileState.updateNursePhoneNumSuccess({required PutModel model}) = _UpdateNursePhoneNumSuccess;
  const factory ProfileState.updateNursePhoneNumError({required String error}) = _UpdateNursePhoneNumError;

  const factory ProfileState.updateNurseWorkTimeSuccess({required PutModel model}) = _UpdateNurseWorkTimeSuccess;
  const factory ProfileState.updateNurseWorkTimeError({required String error}) = _UpdateNurseWorkTimeError;

  const factory ProfileState.updateNursePriceperhourSuccess({required PutModel model}) = _UpdateNursePriceperhourSuccess;
  const factory ProfileState.updateNursePriceperhourError({required String error}) = _UpdateNursePriceperhourError;

  const factory ProfileState.updateNurseDescriptionSuccess({required PutModel model}) = _UpdateNurseDescriptionSuccess;
  const factory ProfileState.updateNurseDescriptionError({required String error}) = _UpdateNurseDescriptionError;

  const factory ProfileState.updateNurseGovernoratesSuccess({required PutModel model}) = _UpdateNurseGovernoratesSuccess;
  const factory ProfileState.updateNurseGovernoratesError({required String error}) = _UpdateNurseGovernoratesError;

  const factory ProfileState.updateUserUsernameSuccess({required MapModel model}) = _UpdateUserUsernameSuccess;
  const factory ProfileState.updateUserUsernameError({required String error}) = _UpdateUserUsernameError;

  const factory ProfileState.changePasswordSuccess({required String message}) = _ChangePasswordSuccess;
  const factory ProfileState.changePasswordError({required String error}) = _ChangePasswordError;
}
