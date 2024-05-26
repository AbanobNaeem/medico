import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';

part 'profile_web_services.g.dart';

@RestApi(baseUrl: AppConstants.domain)
abstract class ProfileWebServices {
  factory ProfileWebServices(Dio dio, {String baseUrl}) = _ProfileWebServices;

  @GET("Doctor/GetDoctorProfil")
  Future<ProfileModel> getDoctorProfile({
    @Field() required int userId,
  });

  @GET("Nurse/GetNurseprofil")
  Future<ProfileModel> getNurseProfile({
    @Field() required int userId,
  });
  @GET("User/GetUseProfil")
  Future<ProfileModel> getUserProfile({
    @Field() required int userId,
  });
}
