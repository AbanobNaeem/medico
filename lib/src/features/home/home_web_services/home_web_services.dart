import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/home/data/models/get_doctor.dart';
import 'package:xpert/src/features/home/data/models/get_nurse_or_doctor_info.dart';

part 'home_web_services.g.dart';

@RestApi(baseUrl: AppConstants.domain)
abstract class HomeWebServices {
  factory HomeWebServices(Dio dio, {String baseUrl}) = _HomeWebServices;

  @GET("User/GetDoctorsByLocationAndSpeciality")
  Future<GetDoctorOrNurse> getDoctor({
    @Field() required String speciality,
    @Field() required String governorate,
  });

  @GET("User/GetNurseByLocationAndSpeciality")
  Future<GetDoctorOrNurse> getNurse({
    @Field() required String governorate,
  });

  @GET("Nurse/GetNurseInfo")
  Future<GetNurseOrDoctorInfo> getNurseInfo({
    @Field() required int userId,
  });

  @GET("Doctor/GetDoctorInfo")
  Future<GetNurseOrDoctorInfo> getDoctorInfo({
    @Field() required int userId,
  });

  @POST("Rating/AddRating")
  Future<String> addRating({
    @Field() required int userId,
    @Field() required int ratingValue,
  });
}
