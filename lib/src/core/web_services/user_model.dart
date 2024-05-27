class UserModel {
  int? userId;
  String? userType;
  String? name;
  String? type;
  String? title;
  int? status;
  String? traceId;
  Errors? errors;
  String? error;

  UserModel(
      {this.userId,
      this.userType,
      this.name,
      this.type,
      this.title,
      this.status,
      this.traceId,
      this.errors});

  UserModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      userId = json['userId'];
      userType = json['userType'];
      name = json['name'];
      type = json['type'];
      title = json['title'];
      status = json['status'];
      traceId = json['traceId'];
      errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
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
    data['type'] = type;
    data['title'] = title;
    data['status'] = status;
    data['traceId'] = traceId;
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? email;
  List<String>? password;

  Errors({this.email, this.password});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    password = json['password'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
