// Package imports:
import 'package:get_it/get_it.dart';
import 'package:xpert/src/features/auth/business_logic/cubit/otp_timer_cubit.dart';
import 'package:xpert/src/features/bottom_nav_bar/business_logic/nav_bar_cubit/nav_bar_cubit.dart';

//!project imports

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<OtpTimerCubit>(() => OtpTimerCubit());
  getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());
}
