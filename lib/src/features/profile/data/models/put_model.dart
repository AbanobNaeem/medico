class PutModel {
  String? newPriceperhour;
  String? newPhoneNum;
  String? newDescription;
  String? newWorkTime;
  String? newSpeciality;
  String? newGovernorates;
  String? newUsername;
  String? username;
  String? speciality;
  String? phoneNum;
  String? workTime;
  String? address;
  String? description;
  String? governorates;

  PutModel(
      {this.newPriceperhour,
      this.newPhoneNum,
      this.newDescription,
      this.newWorkTime,
      this.newSpeciality,
      this.newGovernorates,
      this.newUsername,
      this.username,
      this.speciality,
      this.phoneNum,
      this.workTime,
      this.address,
      this.description,
      this.governorates});

  PutModel.fromJson(Map<String, dynamic> json) {
    newPriceperhour = json['newPriceperhour'];
    newPhoneNum = json['newPhoneNum'];
    newDescription = json['newDescription'];
    newWorkTime = json['newWorkTime'];
    newSpeciality = json['newSpeciality'];
    newGovernorates = json['newGovernorates'];
    newUsername = json['newUsername'];
    username = json['username'];
    speciality = json['speciality'];
    phoneNum = json['phoneNum'];
    workTime = json['workTime'];
    address = json['address'];
    description = json['description'];
    governorates = json['governorates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newPriceperhour'] = newPriceperhour;
    data['newPhoneNum'] = newPhoneNum;
    data['newDescription'] = newDescription;
    data['newWorkTime'] = newWorkTime;
    data['newSpeciality'] = newSpeciality;
    data['newGovernorates'] = newGovernorates;
    data['newUsername'] = newUsername;
    data['username'] = username;
    data['speciality'] = speciality;
    data['phoneNum'] = phoneNum;
    data['workTime'] = workTime;
    data['address'] = address;
    data['description'] = description;
    data['governorates'] = governorates;
    return data;
  }
}