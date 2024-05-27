import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'dart:async';

import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';

class SplashScreenLogic {
  static late Timer _timer;

  static void splashInit() {
    _loadData();
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  static void dispose() {
    _timer.cancel();
  }

  static Future _loadData() async {
    myId = await CacheHelper.getData(key: AppConstants.myId);
    myType = await CacheHelper.getData(key: AppConstants.myType);
    myUserName = await CacheHelper.getData(key: AppConstants.myUserName);
    // isSkipOnBoarding = await CacheHelper.saveData(key: AppConstants.onBoarding,value: false );
    isSkipOnBoarding = await CacheHelper.getData(key: AppConstants.onBoarding);

    isSkipOnBoarding = await CacheHelper.getData(key: AppConstants.onBoarding);
    log("myId:$myId myType:$myType  myUserName:$myUserName  isSkipOnBoarding $isSkipOnBoarding");
  }

  static void _goNext() {
    if (isSkipOnBoarding != null && isSkipOnBoarding!) {
      if (myId == null && myType == null && myUserName == null) {
        Navigator.pushReplacementNamed(
            navigatorKey.currentContext!, Routes.authTapBar);
      } else if (myId != null && myType != null && myUserName != null) {
        Navigator.pushReplacementNamed(
            navigatorKey.currentContext!, Routes.navigationViewRoute);
        return;
      }
    } else {
      Navigator.pushReplacementNamed(
          navigatorKey.currentContext!, Routes.onboarding);
    }
  }
}
