import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';

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
  // DiseasesModel(
  //   title: StringsManager.cancer,
  //   image: AssetsManager.cancerPic,
  //   onTap: () {
  //     Navigator.pushNamed(
  //       navigatorKey.currentContext!,
  //       Routes.diseasesDetails,
  //       arguments: {"title": StringsManager.cancer},
  //     );
  //   },
  // ),
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
List<DiseasesDetailsModel> listType(String title) {
  switch (title) {
    case StringsManager.boneFractures:
      return boneFracturesList;
    case StringsManager.brainTumor:
      return brainTumorList;
    case StringsManager.cancer:
      return cancerList;
    case StringsManager.breastCancer:
      return breastCancerList;
    default:
      return boneFracturesList;
  }
}

String model(String title) {
  switch (title) {
    case StringsManager.boneFractures:
      return AssetsManager.aiBoneFractureModel;
    case StringsManager.brainTumor:
      return AssetsManager.aiBrainTumorModel;

    case StringsManager.breastCancer:
      return AssetsManager.aiBreastCancerModel;
    default:
      return '';
  }
}

String label(String title) {
  switch (title) {
    case StringsManager.boneFractures:
      return AssetsManager.aiBoneFractureLabel;
    case StringsManager.brainTumor:
      return AssetsManager.aiBoneFractureLabel;

    case StringsManager.breastCancer:
      return AssetsManager.aiBreastCancerLabel;
    default:
      return '';
  }
}

List<String> resolutionList = [
  AppConstants.resolutionLow,
  AppConstants.resolutionMedium,
  AppConstants.resolutionHigh,
];

Color color(double condition) {
  if (condition >= 1 && condition < 30) {
    return ColorManager.yellow;
  } else if (condition >= 30 && condition < 70) {
    return ColorManager.green;
  } else {
    return ColorManager.brightRed;
  }
}

String? briefCondition(String? title) {
  switch (title) {
    case "Comminuted fracture":
      return AppConstants.comminutedFracture;
    case "Greenstick fracture":
      return AppConstants.greenstickFracture;
    case "Fracture Dislocation":
      return AppConstants.fractureDislocation;
    case "Compression-Crush fracture":
      return null;
    case "Hairline Fracture":
      return null;
    case "Impacted fracture":
      return null;
    case "Intra-articular fracture":
      return null;
    case "Longitudinal fracture":
      return null;
    case "Spiral Fracture":
      return null;
    case "Avulsion fracture":
      return null;
    case "Oblique fracture":
      return null;
    default:
      return null;
  }
}

void _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    showErrorToast(
        '${StringsManager.couldNotLaunch} $url', navigatorKey.currentContext!);
  }
}

void launchUrlCondition(String? title) {
  switch (title) {
    case "Comminuted fracture":
      return _launchUrl(AppConstants.comminutedFractureUrl);
    case "Greenstick fracture":
      return _launchUrl(AppConstants.greenstickFractureUrl);

    case "Fracture Dislocation":
      return _launchUrl(AppConstants.fractureDislocationUrl);

    case "Compression-Crush fracture":
      return;
    case "Hairline Fracture":
      return;
    case "Impacted fracture":
      return;
    case "Intra-articular fracture":
      return;
    case "Longitudinal fracture":
      return;
    case "Spiral Fracture":
      return;
    case "Avulsion fracture":
      return;
    case "Oblique fracture":
      return;
    default:
      return;
  }
}

void sendImage(String title, File image) {
  switch (title) {
    case StringsManager.boneFractures:
      return RouteGenerator.homeCubit.uploadOfBonefractures(image);
    case StringsManager.brainTumor:
      return RouteGenerator.homeCubit.uploadOfBrainTumor(image);

    case StringsManager.breastCancer:
      return RouteGenerator.homeCubit.uploadOfBreastCancer(image);
    default:
      return;
  }
}
