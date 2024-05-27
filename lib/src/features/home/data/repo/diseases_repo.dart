import 'dart:convert';
import 'dart:io';
import 'package:xpert/src/core/web_services/api_result.dart';
import 'package:xpert/src/core/web_services/network_exceptions.dart';
import 'package:xpert/src/core/web_services/web_services.dart';
import 'package:xpert/src/features/home/data/models/brain_tumor_model.dart';
import 'package:xpert/src/features/home/data/models/breast_cancer.dart';
import 'package:xpert/src/features/home/data/models/diseases_model.dart';
import 'package:xpert/src/features/home/data/models/get_doctor.dart';
import 'package:xpert/src/features/home/data/models/get_nurse_or_doctor_info.dart';
import 'package:xpert/src/features/home/data/models/top_doctor_model.dart';
import 'package:xpert/src/features/home/home_web_services/home_web_services.dart';

class HomeRepo {
  final WebServices _webServices;
  final HomeWebServices _homeWebServices;

  HomeRepo(this._webServices, this._homeWebServices);

  Future<ApiResult<BoneFracturesModel>> uploadOfBonefractures(
      File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();

    String base64Image = base64Encode(imageBytes);

    try {
      var response = await _webServices.bonefractures(base64Image);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<BrainTumorModel>> uploadOfBrainTumor(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();

    String base64Image = base64Encode(imageBytes);

    try {
      var response = await _webServices.brainTumor(base64Image);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<BreastCancerModel>> uploadOfBreastCancer(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();

    String base64Image = base64Encode(imageBytes);

    try {
      var response = await _webServices.breastCancer(base64Image);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<GetDoctorOrNurse>> getDoctor(
      {required String speciality, required String governorate}) async {
    try {
      var response = await _homeWebServices.getDoctor(
        governorate: governorate,
        speciality: speciality,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<GetDoctorOrNurse>> getNurse(
      {required String governorate}) async {
    try {
      var response = await _homeWebServices.getNurse(
        governorate: governorate,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<GetNurseOrDoctorInfo>> getNurseInfo(
      {required int nurseId}) async {
    try {
      var response = await _homeWebServices.getNurseInfo(
        userId: nurseId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<GetNurseOrDoctorInfo>> getDoctorInfo(
      {required int doctorId}) async {
    try {
      var response = await _homeWebServices.getDoctorInfo(
        userId: doctorId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<String>> addRating({
    required int userId,
    required int doctorOrnursId,
    required int ratingValue,
  }) async {
    try {
      var response = await _homeWebServices.addRating(
        userId: userId,
        doctorOrnursId: doctorOrnursId,
        ratingValue: ratingValue,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<List<TopDoctorsModel>>> getTopDoctors() async {
    try {
      var response = await _homeWebServices.getTopDoctors();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }
}
