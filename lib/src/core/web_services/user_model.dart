class UserModel {
  bool? success;
  String? message;
  UserDataModel? dataModel;
  String? tokenType;
  int? expiresIn;
  UserErrorsModel? errors;
  String? error;

  UserModel({
    this.success,
    this.tokenType,
    this.expiresIn,
    this.dataModel,
    this.message,
    this.errors,
    this.error,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    dataModel =
        json['data'] != null ? UserDataModel.fromJson(json['data']) : null;
    tokenType = json['token_type'];
    expiresIn = json['expires_in'] ?? 0;
    message = json['message'];
    errors = json['errors'] != null
        ? UserErrorsModel.fromJson(json['errors'])
        : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "data": dataModel,
      "tokenType": tokenType,
      "expiresIn": expiresIn,
    };
  }
}

class UserDataModel {
  int? id;
  String? email;
  String? location;
  String? description;
  dynamic chatPrice;
  dynamic callPrice;
  dynamic videoCallPrice;
  String? title;
  String? countryCode;
  String? mobile;
  int? specialtyId;
  String? firstName;
  String? lastName;
  String? universityName;
  String? universityYear;
  String? universityDegree;
  String? universitySpecialty;
  int? active;
  int? identityIsAuthentication;
  String? createdAt;
  String? updatedAt;
  String? token;
  String? facebook;
  String? google;
  String? apple;
  String? image;
  dynamic imageId;

  UserDataModel({
    this.id,
    this.email,
    this.location,
    this.description,
    this.chatPrice,
    this.callPrice,
    this.videoCallPrice,
    this.title,
    this.countryCode,
    this.mobile,
    this.specialtyId,
    this.firstName,
    this.lastName,
    this.universityName,
    this.universityYear,
    this.universityDegree,
    this.universitySpecialty,
    this.active,
    this.identityIsAuthentication,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.facebook,
    this.google,
    this.apple,
    this.image,
    this.imageId,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    email = json['email'] ?? '';
    location = json['location'] ?? '';
    description = json['description'] ?? '';
    chatPrice = json['chat_price'] ?? '';
    callPrice = json['call_price'] ?? '';
    videoCallPrice = json['video_call_price'] ?? '';
    title = json['title'] ?? '';
    countryCode = json['country_code'] ?? '';
    mobile = json['mobile'] ?? '';
    specialtyId = json['specialty_id'] ?? 0;
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    universityName = json['university_name'] ?? '';
    universityYear = json['university_year'] ?? '';
    universityDegree = json['university_degree'] ?? '';
    universitySpecialty = json['university_specialty'] ?? '';
    active = json['active'] ?? 0;
    identityIsAuthentication = json['identity_is_authentication'] ?? 0;
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    token = json['token'] ?? '';
    facebook = json['facebook'] ?? '';
    google = json['google'] ?? '';
    apple = json['apple'] ?? '';
    image = json['image'] ?? '';
    imageId = json['image_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'location': location,
      'description': description,
      'chat_price': chatPrice,
      'call_price': callPrice,
      'video_call_price': videoCallPrice,
      'title': title,
      'country_code': countryCode,
      'mobile': mobile,
      'specialty_id': specialtyId,
      'first_name': firstName,
      'last_name': lastName,
      'university_name': universityName,
      'university_year': universityYear,
      'university_degree': universityDegree,
      'university_specialty': universitySpecialty,
      'active': active,
      'identity_is_authentication': identityIsAuthentication,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'token': token,
      'image': image,
      'image_id': imageId,
    };
  }
}

class UserErrorsModel {
  List<dynamic>? password;
  List<dynamic>? email;

  UserErrorsModel({
    this.password,
    this.email,
  });

  UserErrorsModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }
}
