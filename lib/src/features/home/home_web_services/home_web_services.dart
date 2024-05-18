import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/home/data/models/get_doctor.dart';

part 'home_web_services.g.dart';

@RestApi(baseUrl: AppConstants.chatDomain)
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
}
