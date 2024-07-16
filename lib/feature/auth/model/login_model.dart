class LoginModel {
  User? user;
  String? token;
  String? message;

  LoginModel({this.user, this.token, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}

class User {
  String? phone;
  String? name;
  String? role;
  String? id;

  User({this.phone, this.name, this.role, this.id});

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['name'] = name;
    data['role'] = role;
    data['id'] = id;
    return data;
  }
}