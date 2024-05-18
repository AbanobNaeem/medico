class GetDoctorOrNurse {
  List<DoctorOrNurse>? doctorOrNurse;
  String? message;
  String? errorMessage;

  GetDoctorOrNurse({this.doctorOrNurse, this.message});

  GetDoctorOrNurse.fromJson(Map<String, dynamic> json) {
    if (json['doctor'] != null) {
      doctorOrNurse = <DoctorOrNurse>[];
      json['doctor'].forEach((v) {
        doctorOrNurse!.add(DoctorOrNurse.fromJson(v));
      });
    }
    message = json['message'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorOrNurse != null) {
      data['doctor'] = doctorOrNurse!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class DoctorOrNurse {
  int? id;
  String? username;
  String? profileImage;
  String? speciality;

  DoctorOrNurse({
    this.id,
    this.username,
    this.profileImage,
  });

  DoctorOrNurse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    profileImage = json['profileImage'];
    profileImage = json['speciality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['profileImage'] = profileImage;
    data['speciality'] = profileImage;
    return data;
  }
}
