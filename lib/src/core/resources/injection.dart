import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get_it/get_it.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/web_services/token_interceptor.dart';
import 'package:xpert/src/core/web_services/web_services.dart';
import 'package:xpert/src/features/auth/business_logic/auth_logic/cubit/auth_logic_cubit.dart';
import 'package:xpert/src/features/auth/business_logic/cubit/otp_timer_cubit.dart';
import 'package:xpert/src/features/auth/data/auth_repo.dart';
import 'package:xpert/src/features/auth/web_services/auth_web_services.dart';
import 'package:xpert/src/features/bottom_nav_bar/business_logic/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:xpert/src/features/chat/data/chat_repo.dart';
import 'package:xpert/src/features/chat/web_services/chat_web_services.dart';
import 'package:xpert/src/features/chat_bot/business_logic/chat_bot_cubit.dart';
import 'package:xpert/src/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:xpert/src/features/chat/business_logic/doctor_chat/doctor_chat_cubit.dart';
import 'package:xpert/src/features/home/data/repo/diseases_repo.dart';
import 'package:xpert/src/features/home/home_web_services/home_web_services.dart';
import 'package:xpert/src/features/profile/business_logic/profile/profile_cubit.dart';
import 'package:xpert/src/features/profile/data/repo/profile_repo.dart';
import 'package:xpert/src/features/profile/web_service/profile_web_services.dart';

final getIt = GetIt.instance;
Dio dio = Dio();
Dio dioChatGpt = Dio();

void initGetIt() {
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));

  getIt.registerLazySingleton<ProfileWebServices>(
      () => ProfileWebServices(createAndSetupDio()));

  getIt.registerLazySingleton<ChatBotCubit>(() => ChatBotCubit());

  getIt.registerLazySingleton<ChatWebServices>(
      () => ChatWebServices(createAndSetupDio()));

  getIt.registerLazySingleton<AuthWebServices>(
      () => AuthWebServices(createAndSetupDio()));

  getIt.registerLazySingleton<HomeWebServices>(
      () => HomeWebServices(createAndSetupDio()));

  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));

  getIt.registerLazySingleton<AuthLogicCubit>(() => AuthLogicCubit(getIt()));

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(getIt(), getIt()),
  );

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerLazySingleton<OtpTimerCubit>(() => OtpTimerCubit());
  getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));

  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt()));

  getIt.registerLazySingleton<DoctorChatCubit>(() => DoctorChatCubit(getIt()));
}

Dio createAndSetupDio() {
  dio
    ..options.connectTimeout = const Duration(seconds: 20)
    // ..interceptors.add(DioCacheInterceptor(options: customCacheOptions))
    ..options.receiveTimeout = const Duration(seconds: 20)
    ..options.baseUrl = AppConstants.aiDomain
    ..options.followRedirects = false
    ..options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Content-Disposition': 'attachment; filename=image.txt',
      // 'Accept': 'application/json',
      // 'accept-language': globalLocale,
      // 'Authorization': 'Bearer token',
      // 'Accept': 'application/json',
    };

  // dio.options.headers.update('accept-language', (value) => globalLocale);
  // log('createAndSetupDio after $defaultLang');
  dio.interceptors.add(
    RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 4, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before the first retry
        Duration(seconds: 2), // wait 2 sec before the second retry
        Duration(seconds: 3), // wait 3 sec before the third retry
        Duration(seconds: 4), // wait 4 sec before the fourth retry
      ],
    ),
  );
  dio.interceptors.add(TokenInteroceptor(dio: dio));

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: false,
      responseBody: true,
      request: true,
    ),
  );
  return dio;
}
