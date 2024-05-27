part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.uploadImageLoading() = _UploadBonefracturesLoading;
  const factory HomeState.uploadBonefracturesResult(BoneFracturesModel data) =
      _UploadBonefracturesResult;
  const factory HomeState.uploadBrainTumorResult(BrainTumorModel data) =
      _UploadBrainTumorResult;

  const factory HomeState.uploadBreastCancerResult(BreastCancerModel data) =
      _UploadBreastCancerResult;
  const factory HomeState.uploadImageError(String networkExceptions) =
      _UploadBonefracturesError;

  const factory HomeState.getDoctorLoading() = _GetDoctorLoading;
  const factory HomeState.getDoctorSuccess({required GetDoctorOrNurse data}) =
      _GetDoctorSuccess;
  const factory HomeState.getDoctorError(String networkExceptions) =
      _GetDoctorError;

  const factory HomeState.getNurseLoading() = _GetNurseLoading;
  const factory HomeState.getNurseSuccess({required GetDoctorOrNurse data}) =
      _GetNurseSuccess;
  const factory HomeState.getNurseError(String networkExceptions) =
      _GetNurseError;

  const factory HomeState.getDoctorInfoLoading() = _GetDoctorInfoLoading;
  const factory HomeState.getDoctorInfoSuccess(
      {required GetNurseOrDoctorInfo data}) = _GetDoctorInfoSuccess;
  const factory HomeState.getDoctorInfoError(String networkExceptions) =
      _GetDoctorInfoError;

  const factory HomeState.getNurseInfoLoading() = _GetNurseInfoLoading;
  const factory HomeState.getNurseInfoSuccess(
      {required GetNurseOrDoctorInfo data}) = _GetNurseInfoSuccess;
  const factory HomeState.getNurseInfoError(String networkExceptions) =
      _GetNurseInfoError;

  const factory HomeState.addRatingLoading() = _AddRatingLoading;
  const factory HomeState.addRatingSuccess() = _AddRatingSuccess;
  const factory HomeState.addRatingError(String networkExceptions) =
      _AddRatingError;

  const factory HomeState.getTopDoctorsLoading() = _GetTopDoctorsLoading;
  const factory HomeState.getTopDoctorsSuccess(List<TopDoctorsModel> model) =
      _GetTopDoctorsSuccess;
  const factory HomeState.getTopDoctorsError(String networkExceptions) =
      _GetTopDoctorsError;
}
