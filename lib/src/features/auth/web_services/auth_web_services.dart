import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/web_services/user_model.dart';

part 'auth_web_services.g.dart';

@RestApi(baseUrl: AppConstants.chatDomain)
abstract class AuthWebServices {
  factory AuthWebServices(Dio dio, {String baseUrl}) = _AuthWebServices;
  @POST("SignUp/sign")
  Future<UserModel> register({
    @Field("email") String? email,
    @Field("password") String? password,
    @Field("username") String? username,
  });

  @POST("Login")
  Future<UserModel> login({
    @Field("email") String? email,
    @Field("password") String? password,
  });
}
