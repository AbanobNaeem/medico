import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';
import 'package:xpert/src/core/resources/color_manager.dart';

String convertDateFormat(String iso8601Date) {
  try {
    DateTime dateTime = DateTime.parse(iso8601Date);
    String dateString = DateFormat('yyyy-MM-dd', 'ar').format(dateTime);
    return dateString;
  } catch (e) {
    return iso8601Date;
  }
}

String convertTimestampFormat(String timestamp) {
  try {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  } catch (e) {
    return timestamp;
  }
}

// Output: 06:54 PM

bool validateAndSave(final GlobalKey<FormState> formKey) {
  final form = formKey.currentState;
  if (form!.validate()) {
    form.save();
    return true;
  }
  return false;
}

void getRoute(int index, BuildContext context) {}

void showErrorToast(String errorMessage, BuildContext context) {
  Fluttertoast.showToast(
    msg: errorMessage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: ColorManager.brightRed,
  );
}

void showWarningToast(String warringMessage, BuildContext context) {
  Fluttertoast.showToast(
    msg: warringMessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: ColorManager.brightRed,
  );
}

void showSuccessToast(String doneMessage, BuildContext context) {
  Fluttertoast.showToast(
    msg: doneMessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
  );
}

String dateTimeFromJson(String value) {
  DateTime dateTimeValue = DateTime.parse(value);
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  String formattedDate = dateFormat.format(dateTimeValue);
  return formattedDate;
}

bool isTablet(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  // You can adjust this threshold value according to your needs.
  double tabletThreshold = 1000;
  log("isTablet ${screenWidth >= tabletThreshold || screenHeight >= tabletThreshold}}");
  return screenWidth >= tabletThreshold || screenHeight >= tabletThreshold;
}

String formatTime(int? timeInSeconds) {
  if (timeInSeconds == null) {
    timeInSeconds = 0;
    return '00:00';
  }
  int minutes = timeInSeconds ~/ 60;
  int seconds = timeInSeconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

String obscureText({String? text, String? countryCode}) {
  String? updatedText = text;
  if (text != null) {
    if (text.contains('@')) {
      // Mask characters before '@' with '*'
      updatedText = text.replaceFirstMapped(
        RegExp(r'^(.*)@'),
        (match) => '${'*' * match.group(1)!.length}@',
      );
      return updatedText;
    } else {
      // Mask all digits except the last two
      return updatedText =
          '${countryCode ?? ''} ${text.substring(0, text.length - 2).replaceAll(RegExp(r'\d'), '*') + text.substring(text.length - 2)}';
    }
  } else {
    return '';
  }
}
