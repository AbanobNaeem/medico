class ProfileModel {
  String? userEmail;
  String? username;
  String? profileImage;
  String? speciality;
  String? governorates;
  String? description;
  String? address;
  String? workTime;
  String? phoneNumber;
  int? mostFrequentRating;
  String? priceperhour;

  ProfileModel(
      {this.userEmail,
      this.username,
      this.profileImage,
      this.speciality,
      this.governorates,
      this.description,
      this.address,
      this.workTime,
      this.phoneNumber,
      this.mostFrequentRating,
      this.priceperhour});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userEmail = json['userEmail'];
    username = json['username'];
    profileImage = json['profileImage'];
    speciality = json['speciality'];
    governorates = json['governorates'];
    description = json['description'];
    address = json['address'];
    workTime = json['workTime'];
    phoneNumber = json['phoneNumber'];
    mostFrequentRating = json['mostFrequentRating'];
    priceperhour = json['priceperhour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userEmail'] = userEmail;
    data['username'] = username;
    data['profileImage'] = profileImage;
    data['speciality'] = speciality;
    data['governorates'] = governorates;
    data['description'] = description;
    data['address'] = address;
    data['workTime'] = workTime;
    data['phoneNumber'] = phoneNumber;
    data['mostFrequentRating'] = mostFrequentRating;
    data['priceperhour'] = priceperhour;
    return data;
  }
}