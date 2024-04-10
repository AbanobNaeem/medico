// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';

class StyleManager {
  const StyleManager._internal();
  static const StyleManager _instance = StyleManager._internal(); // singleton
  factory StyleManager() => _instance;

  static TextStyle _getTextStyle(
      double fontSize, FontWeight fontWeight, Color color, double? height) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.defaultFontFamily,
      color: color,
      fontWeight: fontWeight,
      height: height,
    );
  }

// regular style

  static TextStyle getRegularStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.regular,
        color ?? ColorManager.black, height);
  }

// medium style

  static TextStyle getMediumStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.medium,
        color ?? ColorManager.black, height);
  }

// light style

  static TextStyle getLightStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.light,
        color ?? ColorManager.black, height);
  }

// bold style

  static TextStyle getBoldStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.bold,
        color ?? ColorManager.black, height);
  }

// semibold style

  static TextStyle getSemiBoldStyle(
      {double? fontSize, Color? color, double? height}) {
    return _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.semiBold,
        color ?? ColorManager.black, height);
  }
}
