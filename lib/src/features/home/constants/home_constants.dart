import 'package:xpert/src/core/resources/strings_manager.dart';

class CategoriesModel {
  final String title;

  CategoriesModel({required this.title});
}

class TopDoctorsModel {
  final String title;
  final String subtitle;

  TopDoctorsModel({required this.title, required this.subtitle});
}

List<CategoriesModel> categoriesList = [
  CategoriesModel(title: StringsManager.category1),
  CategoriesModel(title: StringsManager.category2),
  CategoriesModel(title: StringsManager.category3),
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
