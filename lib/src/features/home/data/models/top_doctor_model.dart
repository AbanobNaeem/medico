class TopDoctorsModel {
  int? userId;
  String? username;
  String? userprofileimge;
  String? userType;
  String? userSpeciality;
  int? mostFrequentRating;
  String? description;

  TopDoctorsModel(
      {this.userId,
      this.username,
      this.userprofileimge,
      this.userType,
      this.userSpeciality,
      this.mostFrequentRating,
      this.description});

  TopDoctorsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    userprofileimge = json['userprofileimge'];
    userType = json['userType'];
    userSpeciality = json['userSpeciality'];
    mostFrequentRating = json['mostFrequentRating'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['userprofileimge'] = userprofileimge;
    data['userType'] = userType;
    data['userSpeciality'] = userSpeciality;
    data['mostFrequentRating'] = mostFrequentRating;
    data['description'] = description;
    return data;
  }
}
