class UserModel {
  int? userId;
  String? userType;
  String? name;
  String? error;

  UserModel({this.userId, this.userType, this.name});

  UserModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      userId = json['userId'];
      userType = json['userType'];
      name = json['name'];
    }
    if (json is String) {
      error = json;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userType'] = userType;
    data['name'] = name;
    return data;
  }
}
