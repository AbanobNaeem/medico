class MapModel {
  String? profileImageUrl;
  String? newUsername;

  MapModel({this.profileImageUrl});

  MapModel.fromJson(Map<String, dynamic> json) {
    profileImageUrl = json['profileImageUrl'];
    newUsername = json['newUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileImageUrl'] = profileImageUrl;
    data['newUserName'] = newUsername;
    return data;
  }
}
