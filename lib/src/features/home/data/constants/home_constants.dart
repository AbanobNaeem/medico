import 'package:flutter/material.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
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

List<CategoriesModel> categoriesList = [
  CategoriesModel(
    title: StringsManager.diseases,
    onTap: () {
      Navigator.pushNamed(navigatorKey.currentContext!, Routes.diseases);
    },
  ),
  CategoriesModel(
    title: StringsManager.doctors,
    onTap: () {
      Navigator.pushNamed(
          navigatorKey.currentContext!, Routes.doctorsListScreen);
    },
  ),
  CategoriesModel(
    title: StringsManager.healthCare,
    onTap: () {
      Navigator.pushNamed(
          navigatorKey.currentContext!, Routes.healthCareScreen);
    },
  ),
];

class SliderModel {
  final String desc;
  final String? name;
  final String? speciality;
  final String image;

  SliderModel({
    required this.desc,
    this.name,
    this.speciality,
    required this.image,
  });

  static List<SliderModel> sliderList = [
    SliderModel(
      desc: StringsManager.specialistDesc1,
      name: StringsManager.specialistDrName1,
      image: AssetsManager.doctorPic,
      speciality: StringsManager.specialist1,
    ),
    SliderModel(
      desc: "You can ask the chatbot for any information or inquiry.",
      image: AssetsManager.doctorPic2,
    ),
    SliderModel(
      desc: "Are you looking for a healthcare professional of your desires?",
      name: "R.N Ahmed Mostafa",
      image: AssetsManager.doctorPic3,
    ),
  ];
}
