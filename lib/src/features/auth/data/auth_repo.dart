import 'package:xpert/src/core/web_services/api_result.dart';
import 'package:xpert/src/core/web_services/network_exceptions.dart';
import 'package:xpert/src/core/web_services/user_model.dart';
import 'package:xpert/src/features/auth/web_services/auth_web_services.dart';

class AuthRepo {
  final AuthWebServices _webServices;

  AuthRepo(
    AuthWebServices webServices,
  ) : _webServices = webServices;

  Future<ApiResult<UserModel>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _webServices.login(
        email: email,
        password: password,
      );

      final model = UserModel.fromJson(response);

      return ApiResult.success(model);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<UserModel>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      var response = await _webServices.register(
        email: email,
        password: password,
        username: username,
      );
      final model = UserModel.fromJson(response);

      return ApiResult.success(model);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }
}
