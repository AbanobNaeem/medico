import 'package:xpert/src/core/web_services/api_result.dart';
import 'package:xpert/src/core/web_services/network_exceptions.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';
import 'package:xpert/src/features/profile/web_service/profile_web_services.dart';

class ProfileRepo {
  final ProfileWebServices _profileWebServices;

  ProfileRepo(
    ProfileWebServices profileWebServices,
  ) : _profileWebServices = profileWebServices;

  Future<ApiResult<ProfileModel>> getDoctorProfile({required int id}) async {
    try {
      var response = await _profileWebServices.getDoctorProfile(userId: id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<ProfileModel>> getUserProfile({required int id}) async {
    try {
      var response = await _profileWebServices.getUserProfile(userId: id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<ProfileModel>> getNurseProfile({required int id}) async {
    try {
      var response = await _profileWebServices.getNurseProfile(userId: id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }
}
