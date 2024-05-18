class UserModel {
  int? userId;
  String? userType;
  String? name;

  UserModel({this.userId, this.userType, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userType = json['userType'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userType'] = userType;
    data['name'] = name;
    return data;
  }
}