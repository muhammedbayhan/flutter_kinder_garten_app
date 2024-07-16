class OtpModel {
  User? user;
  String? accessToken;
  String? message;

  OtpModel({this.user, this.accessToken, this.message});

  OtpModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['access_token'] = accessToken;
    data['message'] = message;
    return data;
  }
}

class User {
  String? name;
  String? phone;
  String? role;
  String? id;
  String? roleId;

  User({this.name, this.phone, this.role, this.id, this.roleId});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    role = json['role'];
    id = json['id'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['role'] = role;
    data['id'] = id;
    data['role_id'] = roleId;
    return data;
  }
}