// Dart imports:
import 'dart:ui';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontConstants {
  const FontConstants._internal();
  static const FontConstants _instance = FontConstants._internal(); // singleton
  factory FontConstants() => _instance;
  static const String defaultFontFamily = "Poppins";
}

class FontWeightManager {
  const FontWeightManager._internal();
  static const FontWeightManager _instance =
      FontWeightManager._internal(); // singleton
  factory FontWeightManager() => _instance;
  
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  const FontSize._internal();
  static const FontSize _instance = FontSize._internal(); // singleton
  factory FontSize() => _instance;

  static double s8 = 8.spMin;

  static double s10 = 10.spMin;

  static double s12 = 12.spMin;

  static double s14 = 14.spMin;

  static double s16 = 16.spMin;

  static double s18 = 18.spMin;

  static double s20 = 20.spMin;

  static double s22 = 22.spMin;

  static double s30 = 30.spMin;

  static double s35 = 35.spMin;

  static double s40 = 40.spMin;

  static double s45 = 45.spMin;

  static double s50 = 50.spMin;
}
