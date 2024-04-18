// Flutter imports:
import 'package:flutter/material.dart';
// Packages imports:
import 'package:flutter_bloc/flutter_bloc.dart';
// Project imports:
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/injection.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/auth/business_logic/cubit/otp_timer_cubit.dart';
import 'package:xpert/src/features/auth/presentation/forget_password/presentation/forget_password_screen.dart';
import 'package:xpert/src/features/auth/presentation/otp/otp_screen.dart';
import 'package:xpert/src/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:xpert/src/features/auth/presentation/tab_bar/auth_tab_bar.dart';
import 'package:xpert/src/features/bottom_nav_bar/business_logic/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:xpert/src/features/bottom_nav_bar/presentation/screens/bottom_nav_bar.dart';
import 'package:xpert/src/features/chat_bot/business_logic/cubit/chat_bot_cubit.dart';
import 'package:xpert/src/features/chat_bot/presentation/screens/chatbot_lock_screen.dart';
import 'package:xpert/src/features/chat_bot/presentation/screens/chatbot_screen.dart';
import 'package:xpert/src/features/home/business_logic/cubit/home_cubit.dart';
import 'package:xpert/src/features/home/presentation/screens/diseases_details_screen.dart';
import 'package:xpert/src/features/home/presentation/screens/diseases_screen.dart';
import 'package:xpert/src/features/home/presentation/screens/home_screen.dart';
import 'package:xpert/src/features/onboarding/presentation/screens/on_boarding_view.dart';
import 'package:xpert/src/features/profile/business_logic/profile/profile_cubit.dart';
import 'package:xpert/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:xpert/src/features/setting/presentation/setting_screen.dart';

class Routes {
  static const String onboarding = '/onboarding';

  static const String authTapBar = '/authTapBar';
  static const String login = '/login';
  static const String registers = '/registers';
  static const String forgotPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';
  static const String otp = '/otp';
  static const String gender = '/Gender';

  static const String home = '/home';
  static const String diseases = '/diseasesScreen';
  static const String diseasesDetails = '/diseasesDetails';

  static const String chatBotLockScreen = '/chatBotLockScreen';
  static const String chatBotScreen = '/chatBotScreen';
  static const String favorites = '/favorites';
  static const String cart = '/cart';
  static const String profileScreen = '/profileScreen';

  static const String navigationViewRoute = '/navigationView';

  static const String setting = '/setting';
}

class RouteGenerator {
  static late OtpTimerCubit otpTimerCubit;
  static late NavBarCubit navBarCubit;
  static late HomeCubit homeCubit;
  static late ChatBotCubit chatBotCubit;
  static late ProfileCubit profileCubit;

  RouteGenerator() {
    otpTimerCubit = getIt<OtpTimerCubit>();
    navBarCubit = getIt<NavBarCubit>();
    homeCubit = getIt<HomeCubit>();
    chatBotCubit = getIt<ChatBotCubit>();
    profileCubit = getIt<ProfileCubit>();
  }
  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case Routes.authTapBar:
        return MaterialPageRoute(builder: (_) => const AuthTabBar());

      case Routes.forgotPassword:
        Map? args = settings.arguments as Map;
        String? email = args['email'];
        String? countryCode = args['countryCode'];
        String? phoneNumber = args['phoneNumber'];
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordScreen(
            email: email,
            countryCode: countryCode,
            phoneNumber: phoneNumber,
          ),
        );

      case Routes.otp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: otpTimerCubit,
            child: const OTPScreen(),
          ),
        );

      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPassword());

      case Routes.navigationViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: navBarCubit,
            child: const BottomNav(),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: homeCubit,
            child: const HomeScreen(),
          ),
        );

      case Routes.chatBotLockScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatBotLockScreen(),
        );

      case Routes.chatBotScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: chatBotCubit,
            child: const ChatBotScreen(),
          ),
        );

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: profileCubit,
            child: const ProfileScreen(),
          ),
        );

      case Routes.setting:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );

      case Routes.diseases:
        return MaterialPageRoute(
          builder: (_) => const DiseasesScreen(),
        );

      case Routes.diseasesDetails:
        var args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => DiseasesDetailsScreen(
            title: args["title"],
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              body: Center(
            child: Text(
              "${StringsManager.noRoute}${settings.name}",
              style: StyleManager.getSemiBoldStyle(fontSize: FontSize.s22),
            ),
          )),
        );
    }
  }
}
