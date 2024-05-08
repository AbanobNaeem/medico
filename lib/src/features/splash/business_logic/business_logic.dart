import 'package:flutter/material.dart';
import 'package:xpert/src/app/app.dart';
import 'dart:async';

import 'package:xpert/src/core/resources/route_manager.dart';

class SplashScreenLogic {
  static late Timer _timer;

  static void splashInit() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  static void dispose() {
    _timer.cancel();
  }

  static void _goNext() {
    Navigator.pushNamedAndRemoveUntil(
      navigatorKey.currentContext!,
      Routes.onboarding,
      (route) => false,
    );
  }
}
