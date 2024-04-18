import 'package:flutter/material.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';

class DiseasesModel {
  final String title;
  final String image;
  final void Function()? onTap;

  DiseasesModel({
    required this.title,
    required this.image,
    this.onTap,
  });
}

class DiseasesDetailsModel {
  final String body;

  DiseasesDetailsModel({
    required this.body,
  });
}

List<DiseasesModel> diseasesList = [
  DiseasesModel(
    title: StringsManager.boneFractures,
    image: AssetsManager.bonefracturesPic,
    onTap: () {
      Navigator.pushNamed(
        navigatorKey.currentContext!,
        Routes.diseasesDetails,
        arguments: {"title": StringsManager.boneFractures},
      );
    },
  ),
  DiseasesModel(
    title: StringsManager.brainTumor,
    image: AssetsManager.braintumorPic,
    onTap: () {
      Navigator.pushNamed(
        navigatorKey.currentContext!,
        Routes.diseasesDetails,
        arguments: {"title": StringsManager.brainTumor},
      );
    },
  ),
  DiseasesModel(
    title: StringsManager.cancer,
    image: AssetsManager.cancerPic,
    onTap: () {
      Navigator.pushNamed(
        navigatorKey.currentContext!,
        Routes.diseasesDetails,
        arguments: {"title": StringsManager.cancer},
      );
    },
  ),
  DiseasesModel(
    title: StringsManager.breastCancer,
    image: AssetsManager.breastcancerPic,
    onTap: () {
      Navigator.pushNamed(
        navigatorKey.currentContext!,
        Routes.diseasesDetails,
        arguments: {"title": StringsManager.breastCancer},
      );
    },
  ),
];

List<DiseasesDetailsModel> boneFracturesList = [
  DiseasesDetailsModel(
    body: StringsManager.boneFracturesBodyText1,
  ),
  DiseasesDetailsModel(
    body: StringsManager.boneFracturesBodyText2,
  ),
  DiseasesDetailsModel(
    body: StringsManager.boneFracturesBodyText3,
  ),
  DiseasesDetailsModel(
    body: StringsManager.boneFracturesBodyText4,
  ),
  DiseasesDetailsModel(
    body: StringsManager.boneFracturesBodyText5,
  ),
  DiseasesDetailsModel(
    body: StringsManager.boneFracturesBodyText6,
  ),
];

List<DiseasesDetailsModel> brainTumorList = [
  DiseasesDetailsModel(
    body: StringsManager.brainTumorBodyText1,
  ),
  DiseasesDetailsModel(
    body: StringsManager.brainTumorBodyText2,
  ),
  DiseasesDetailsModel(
    body: StringsManager.brainTumorBodyText3,
  ),
];

List<DiseasesDetailsModel> cancerList = [
  DiseasesDetailsModel(
    body: StringsManager.cancerBodyText1,
  ),
  DiseasesDetailsModel(
    body: StringsManager.cancerBodyText2,
  ),
  DiseasesDetailsModel(
    body: StringsManager.cancerBodyText3,
  ),
  DiseasesDetailsModel(
    body: StringsManager.cancerBodyText4,
  ),
  DiseasesDetailsModel(
    body: StringsManager.cancerBodyText5,
  ),
];

List<DiseasesDetailsModel> breastCancerList = [
  DiseasesDetailsModel(
    body: StringsManager.breastCancerBodyText1,
  ),
  DiseasesDetailsModel(
    body: StringsManager.breastCancerBodyText2,
  ),
  DiseasesDetailsModel(
    body: StringsManager.breastCancerBodyText3,
  ),
  DiseasesDetailsModel(
    body: StringsManager.breastCancerBodyText4,
  ),
];
