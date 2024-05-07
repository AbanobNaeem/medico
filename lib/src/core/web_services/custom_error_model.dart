class CustomErrorModel {
  String? message;
  Data? data;

  CustomErrorModel({this.message, this.data});

  CustomErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? identity;
  String? identityType;

  Data({this.identity, this.identityType});

  Data.fromJson(Map<String, dynamic> json) {
    identity = json['identity'];
    identityType = json['identity_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identity'] = identity;
    data['identity_type'] = identityType;
    return data;
  }
}
