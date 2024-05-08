import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/home/data/models/brain_tumor_model.dart';
import 'package:xpert/src/features/home/data/models/diseases_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: AppConstants.domain)
abstract class WebServices {
  static const String apiKey = "vv5Bsj27ASI9XrvZH6Bz";

  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @POST("bone-break-classification/2?api_key=$apiKey")
  Future<BoneFracturesModel> bonefractures(@Body() String base64Image);

  @POST("brain-tumor-e0ofl/1?api_key=$apiKey")
  Future<BrainTumorModel> brainTumor(@Body() String base64Image);
}
