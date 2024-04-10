// Flutter imports:
import 'package:flutter/material.dart';

class ColorManager {
  const ColorManager._internal();
  static const ColorManager _instance = ColorManager._internal(); // singleton
  factory ColorManager() => _instance;

  static const Color primary = Color(0xff535CC1);
  
  static const Color secondary = Color(0xff000000);

  static const Color black = Color(0xff000000);

  static const Color white = Color(0xffFFFFFF);

  static const Color transparent = Colors.transparent;

  static const Color lightGrey = Color(0xffF4F4F4);
  static const Color lightGrey2 = Color(0xffEEEEEE);
  static const Color lightGrey3 = Color(0xffD9D9D9);

  static const Color silver = Color(0xffC7C7C7);

  static const Color silverGray = Color(0xffE0E0E0);

  static const Color mediumGray = Color(0xffA6A6A6);

  static const Color mediumGrey2 = Color(0xffEBEBEB);

  static const Color paleSilver = Color(0xffECECEC);

  static const Color yellow = Color(0xffFFCE31);

  static const Color lightSalmonPink = Color(0xffFFD7D7);

  static const Color brightRed = Color(0xffFE0707);

  static const Color mediumSeaGreen = Color(0xff3EAD55);

  static const Color turquoise = Color(0xff00D7BD);

  static const Color periwinkleBlue = Color(0xff99A1FF);
  static const Color royalBlue = Color(0xff535CC1);
  static const Color bluishPurple = Color(0xff6971CD);

  
}