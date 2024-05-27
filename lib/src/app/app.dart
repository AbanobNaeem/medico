import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/generated/l10n.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/theme_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker/country_code_picker.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal(); // singleton
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  RouteGenerator routeGenerator = RouteGenerator();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      log("resumed");
    } else if (state == AppLifecycleState.inactive) {
      log("inactive");
    } else if (state == AppLifecycleState.paused) {
      log("paused");
    } else if (state == AppLifecycleState.detached) {
      log("detached");
    } else {
      log("message");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp(routeGenerator);
  }
}

Widget _buildMaterialApp(RouteGenerator routeGenerator) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    useInheritedMediaQuery: true,
    builder: (context, state) {
      return MaterialApp(
        title: AppConstants.appName,
        navigatorKey: navigatorKey,
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          CountryLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.kLightTheme,
        onGenerateRoute: routeGenerator.getRoute,
        initialRoute: Routes.splashScreen,
      );
    },
  );
}
