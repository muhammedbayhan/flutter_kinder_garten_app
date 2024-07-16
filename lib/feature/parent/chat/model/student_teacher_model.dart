class StudentTeacherModel {
  String? school;
  String? classes;
  User? user;
  String? id;

  StudentTeacherModel({this.school, this.classes, this.user, this.id});

  StudentTeacherModel.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    classes = json['classes'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['school'] = school;
    data['classes'] = classes;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class User {
  String? name;
  String? phone;
  String? role;
  String? id;

  User({this.name, this.phone, this.role, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['role'] = role;
    data['id'] = id;
    return data;
  }
}