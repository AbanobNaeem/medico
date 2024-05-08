import 'package:dio/dio.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';
import '../resources/constants.dart';

class TokenInteroceptor extends Interceptor {
  final Dio dio;
  TokenInteroceptor({required this.dio});
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenValue = CacheHelper.getData(key: AppConstants.ACCESS_TOKEN_KEY);
    if (tokenValue != null) {
      options.headers['Authorization'] =
          '${AppConstants.tokenType} $tokenValue';
    }
    options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    // options.headers['Content-Disposition'] = 'attachment; filename=image.txt';

    options.validateStatus = (status) {
      return status == 200 || status == 422 || status == 201 || status! <= 500;
    };
    super.onRequest(options, handler);
  }

  // @override
  // void onError(err, handler) async {
  //   if (err.response?.statusCode == 401) {
  //     // If a 401 response is received, refresh the access token

  //     final refreshToken = await RouteGenerator.authCubit.refreshToken();
  //     String? newAccessToken = refreshToken.dataModel?.token;

  //     // Update the request header with the new access token
  //     err.requestOptions.headers['Authorization'] =
  //         '${AppConstants.tokenType} $newAccessToken';

  //     // Repeat the request with the updated header
  //     return handler.resolve(await dio.fetch(err.requestOptions));
  //   }
  //   super.onError(err, handler);
  //   return handler.next(err);
  // }
}
