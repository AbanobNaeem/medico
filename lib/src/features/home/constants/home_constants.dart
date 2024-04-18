import 'package:flutter/material.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';

class CategoriesModel {
  final String title;
  final void Function()? onTap;

  CategoriesModel({
    required this.title,
    this.onTap,
  });
}

class TopDoctorsModel {
  final String title;
  final String subtitle;

  TopDoctorsModel({required this.title, required this.subtitle});
}

List<CategoriesModel> categoriesList = [
  CategoriesModel(
    title: StringsManager.diseases,
    onTap: () {
      Navigator.pushNamed(navigatorKey.currentContext!, Routes.diseases);
    },
  ),
  CategoriesModel(title: StringsManager.doctors),
  CategoriesModel(title: StringsManager.healthCare),
];

List<TopDoctorsModel> topDoctorsList = [
  TopDoctorsModel(
      title: StringsManager.topDoctorsTitle1,
      subtitle: StringsManager.topDoctorsSubTitle1),
  TopDoctorsModel(
      title: StringsManager.topDoctorsTitle2,
      subtitle: StringsManager.topDoctorsSubTitle2),
  TopDoctorsModel(
      title: StringsManager.topDoctorsTitle3,
      subtitle: StringsManager.topDoctorsSubTitle3),
];
