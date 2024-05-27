class GetNurseOrDoctorInfo {
  String? username;
  String? profileImage;
  String? speciality;
  String? governorates;
  String? description;
  String? address;
  String? pricePerHour;
  String? phoneNumber;
  String? workTime;
  int? mostFrequentRating;

  

  GetNurseOrDoctorInfo({
    this.username,
    this.profileImage,
    this.speciality,
    this.governorates,
    this.description,
    this.address,
    this.pricePerHour,
    this.phoneNumber,
    this.mostFrequentRating,
    this.workTime,
  });

  GetNurseOrDoctorInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profileImage = json['profileImage'];
    speciality = json['speciality'];
    governorates = json['governorates'];
    description = json['description'];
    address = json['address'];
    pricePerHour = json['priceperhour'];
    phoneNumber = json['phoneNumber'];
    mostFrequentRating = json['mostFrequentRating'];
    workTime = json['workTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['profileImage'] = profileImage;
    data['speciality'] = speciality;
    data['governorates'] = governorates;
    data['description'] = description;
    data['address'] = address;
    data['priceperhour'] = pricePerHour;
    data['phoneNumber'] = phoneNumber;
    data['mostFrequentRating'] = mostFrequentRating;
    data['workTime'] = workTime;
    return data;
  }
}
