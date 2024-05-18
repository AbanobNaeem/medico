part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.uploadImageLoading() = _UploadBonefracturesLoading;
  const factory HomeState.uploadBonefracturesResult(BoneFracturesModel data) = _UploadBonefracturesResult;
  const factory HomeState.uploadBrainTumorResult(BrainTumorModel data) = _UploadBrainTumorResult;
  const factory HomeState.uploadImageError(String networkExceptions) = _UploadBonefracturesError;


  const factory HomeState.getDoctorLoading() = _GetDoctorLoading;
  const factory HomeState.getDoctorSuccess({required GetDoctorOrNurse data}) = _GetDoctorSuccess;
  const factory HomeState.getDoctorError(String networkExceptions) = _GetDoctorError;

  const factory HomeState.getNurseLoading() = _GetNurseLoading;
  const factory HomeState.getNurseSuccess({required GetDoctorOrNurse data}) = _GetNurseSuccess;
  const factory HomeState.getNurseError(String networkExceptions) = _GetNurseError;

}