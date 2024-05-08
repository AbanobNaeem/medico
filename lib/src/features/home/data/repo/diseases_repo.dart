import 'dart:convert';
import 'dart:io';
import 'package:xpert/src/core/web_services/api_result.dart';
import 'package:xpert/src/core/web_services/network_exceptions.dart';
import 'package:xpert/src/core/web_services/web_services.dart';
import 'package:xpert/src/features/home/data/models/brain_tumor_model.dart';
import 'package:xpert/src/features/home/data/models/diseases_model.dart';

class DiseasesRepo {
  final WebServices _webServices;

  DiseasesRepo(this._webServices);

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
}
