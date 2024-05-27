// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/profile/data/models/profile_image.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';
import 'package:xpert/src/features/profile/data/models/put_model.dart';

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

  @POST("Profileimge/profile-image")
  @MultiPart()
  Future<MapModel> addImage({
    @Part() required int userId,
    @Part() required File file,
  });
////////////////////////////////////////////////////////////////////////////////////UpdateDoctor////////////////////////////////////////////////////////
  @PUT("Doctor/UpdateDoctorUsername")
  Future<PutModel> updateDoctorUsername({
    @Field() required int userId,
    @Field() required String newUsername,
  });

  @PUT("Doctor/UpdateDoctorSpeciality")
  Future<PutModel> updateDoctorSpeciality({
    @Field() required int userId,
    @Field() required String speciality,
  });

  @PUT("Doctor/UpdateDoctorPhoneNum")
  Future<PutModel> updateDoctorPhoneNum({
    @Field() required int userId,
    @Field() required String phoneNum,
  });
  @PUT("Doctor/UpdateDoctorWorkTime")
  Future<PutModel> updateDoctorWorkTime({
    @Field() required int userId,
    @Field() required String workTime,
  });
  @PUT("Doctor/UpdateDoctorAddress")
  Future<PutModel> updateDoctorAddress({
    @Field() required int userId,
    @Field() required String address,
  });
  @PUT("Doctor/UpdateDoctorDescription")
  Future<PutModel> updateDoctorDescription({
    @Field() required int userId,
    @Field() required String description,
  });
  @PUT("Doctor/UpdateDoctorGovernorates")
  Future<PutModel> updateDoctorGovernorates({
    @Field() required int userId,
    @Field() required String governorates,
  });

  //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\UpdateDoctor\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  ////////////////////////////////////////////////////////////////////////////////////UpdateNurse///////////////////////////////////////////

  @PUT("Nurse/UpdateNurseUsername")
  Future<PutModel> updateNurseUsername({
    @Field() required int userId,
    @Field() required String newUsername,
  });

  @PUT("Nurse/UpdateNurseSpeciality")
  Future<PutModel> updateNurseSpeciality({
    @Field() required int userId,
    @Field() required String speciality,
  });

  @PUT("Nurse/UpdateNursePhoneNum")
  Future<PutModel> updateNursePhoneNum({
    @Field() required int userId,
    @Field() required String phoneNum,
  });
  @PUT("Nurse/UpdateNurseWorkTime")
  Future<PutModel> updateNurseWorkTime({
    @Field() required int userId,
    @Field() required String workTime,
  });
  @PUT("Nurse/UpdateNursePriceperhour")
  Future<PutModel> updateNursePriceperhour({
    @Field() required int userId,
    @Field() required String priseperhour,
  });
  @PUT("Nurse/UpdateNurseDescription")
  Future<PutModel> updateNurseDescription({
    @Field() required int userId,
    @Field() required String description,
  });
  @PUT("Nurse/UpdateNurseGovernorates")
  Future<PutModel> updateNurseGovernorates({
    @Field() required int userId,
    @Field() required String governorates,
  });

  //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\UpdateNurse\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  @PUT("User/UpdateUserUsername")
  Future<MapModel> updateUserUsername({
    @Field() required int userId,
    @Field() required String newUsername,
  });

  @POST("password/change-password")
  Future<String> changePassword({
    @Field() required int userId,
    @Field() required String oldPassword,
    @Field() required String newPassword,
  });
}
