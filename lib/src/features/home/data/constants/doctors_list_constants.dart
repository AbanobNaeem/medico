import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';

class DoctorsListModel {
  final String image;
  final String drName;
  final String drSpecialty;

  DoctorsListModel({
    required this.image,
    required this.drName,
    required this.drSpecialty,
  });
}

List<DoctorsListModel> doctorsList = [
  DoctorsListModel(
    image: AssetsManager.temp3,
    drName: StringsManager.drAillaAhmed,
    drSpecialty: StringsManager.orthopedist,
  ),
  DoctorsListModel(
    image: AssetsManager.temp4,
    drName: StringsManager.drAhmed,
    drSpecialty: StringsManager.orthopedist,
  ),
  DoctorsListModel(
    image: AssetsManager.temp3,
    drName: StringsManager.drAillaAhmed,
    drSpecialty: StringsManager.orthopedist,
  ),
  DoctorsListModel(
    image: AssetsManager.temp4,
    drName: StringsManager.drAhmed,
    drSpecialty: StringsManager.orthopedist,
  ),
  DoctorsListModel(
    image: AssetsManager.temp3,
    drName: StringsManager.drAillaAhmed,
    drSpecialty: StringsManager.orthopedist,
  ),
  DoctorsListModel(
    image: AssetsManager.temp4,
    drName: StringsManager.drAhmed,
    drSpecialty: StringsManager.orthopedist,
  ),
];
