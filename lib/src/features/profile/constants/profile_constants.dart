import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';

List<String> profileTextFelidTitles = [
  StringsManager.yourEmail,
  StringsManager.yourPassword,
  StringsManager.yourPhone,
  StringsManager.address,
  StringsManager.governorates,
  StringsManager.priceperhour,
  StringsManager.speciality,
];

List<String> getData(ProfileModel model) {
  List<String> profileTextFelid = [
    model.userEmail ?? '',
    '********',
    model.phoneNumber ?? '',
    model.address ?? '',
    model.governorates ?? '',
    model.priceperhour ?? '',
    model.speciality ?? '',
  ];
  return profileTextFelid;
}
