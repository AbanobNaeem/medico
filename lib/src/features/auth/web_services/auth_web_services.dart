import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';

part 'auth_web_services.g.dart';

@RestApi(baseUrl: AppConstants.chatDomain)
abstract class AuthWebServices {
  factory AuthWebServices(Dio dio, {String baseUrl}) = _AuthWebServices;
  @POST("SignUp/sign")
  Future<dynamic> register({
    @Field("email") String? email,
    @Field("password") String? password,
    @Field("username") String? username,
  });

  @POST("Login/login")
  Future<dynamic> login({
    @Field("email") required String email,
    @Field("password") required String password,
  });
}
