part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.uploadImageLoading() = _UploadBonefracturesLoading;
  const factory HomeState.uploadBonefracturesResult(BoneFracturesModel data) = _UploadBonefracturesResult;
  const factory HomeState.uploadBrainTumorResult(BrainTumorModel data) = _UploadBrainTumorResult;
  const factory HomeState.uploadImageError(String networkExceptions) = _UploadBonefracturesError;

}