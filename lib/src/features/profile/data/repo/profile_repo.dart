import 'dart:io';

import 'package:xpert/src/core/web_services/api_result.dart';
import 'package:xpert/src/core/web_services/network_exceptions.dart';
import 'package:xpert/src/features/profile/data/models/profile_image.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';
import 'package:xpert/src/features/profile/data/models/put_model.dart';
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

  Future<ApiResult<MapModel>> addImage(
      {required int id, required File image}) async {
    try {
      var response =
          await _profileWebServices.addImage(userId: id, file: image);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateDoctorUsername(
      {required int id, required String newUsername}) async {
    try {
      var response = await _profileWebServices.updateDoctorUsername(
          userId: id, newUsername: newUsername);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateDoctorSpeciality(
      {required int id, required String speciality}) async {
    try {
      var response = await _profileWebServices.updateDoctorSpeciality(
          userId: id, speciality: speciality);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateDoctorPhoneNum(
      {required int id, required String phoneNum}) async {
    try {
      var response = await _profileWebServices.updateDoctorPhoneNum(
          userId: id, phoneNum: phoneNum);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateDoctorWorkTime(
      {required int id, required String workTime}) async {
    try {
      var response = await _profileWebServices.updateDoctorWorkTime(
          userId: id, workTime: workTime);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateDoctorAddress(
      {required int id, required String address}) async {
    try {
      var response = await _profileWebServices.updateDoctorAddress(
          userId: id, address: address);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateDoctorDescription(
      {required int id, required String description}) async {
    try {
      var response = await _profileWebServices.updateDoctorDescription(
          userId: id, description: description);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateDoctorGovernorates(
      {required int id, required String governorates}) async {
    try {
      var response = await _profileWebServices.updateDoctorGovernorates(
          userId: id, governorates: governorates);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateNurseUsername(
      {required int id, required String newUsername}) async {
    try {
      var response = await _profileWebServices.updateNurseUsername(
          userId: id, newUsername: newUsername);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateNurseSpeciality(
      {required int id, required String speciality}) async {
    try {
      var response = await _profileWebServices.updateNurseSpeciality(
          userId: id, speciality: speciality);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateNursePhoneNum(
      {required int id, required String phoneNum}) async {
    try {
      var response = await _profileWebServices.updateNursePhoneNum(
          userId: id, phoneNum: phoneNum);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateNurseWorkTime(
      {required int id, required String workTime}) async {
    try {
      var response = await _profileWebServices.updateNurseWorkTime(
          userId: id, workTime: workTime);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateNursePriceperhour(
      {required int id, required String priseperhour}) async {
    try {
      var response = await _profileWebServices.updateNursePriceperhour(
          userId: id, priseperhour: priseperhour);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateNurseDescription(
      {required int id, required String description}) async {
    try {
      var response = await _profileWebServices.updateNurseDescription(
          userId: id, description: description);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<PutModel>> updateNurseGovernorates(
      {required int id, required String governorates}) async {
    try {
      var response = await _profileWebServices.updateNurseGovernorates(
          userId: id, governorates: governorates);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<MapModel>> updateUserUsername(
      {required int id, required String newUsername}) async {
    try {
      var response = await _profileWebServices.updateUserUsername(
          userId: id, newUsername: newUsername);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<String>> changePassword(
      {required int id,
      required String oldPassword,
      required String newPassword}) async {
    try {
      var response = await _profileWebServices.changePassword(
        userId: id,
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }
}
