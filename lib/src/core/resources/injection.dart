import 'package:get_it/get_it.dart';
import 'package:xpert/src/features/auth/business_logic/cubit/otp_timer_cubit.dart';
import 'package:xpert/src/features/bottom_nav_bar/business_logic/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:xpert/src/features/chat_bot/business_logic/cubit/chat_bot_cubit.dart';
import 'package:xpert/src/features/home/business_logic/cubit/home_cubit.dart';
import 'package:xpert/src/features/profile/business_logic/profile/profile_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<OtpTimerCubit>(() => OtpTimerCubit());
  getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());
  getIt.registerLazySingleton<ChatBotCubit>(() => ChatBotCubit());
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
}
