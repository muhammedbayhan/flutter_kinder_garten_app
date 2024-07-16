class TeacherParentsModel {
  String? sId;
  List<String>? students;
  User? user;
  String? school;

  TeacherParentsModel({this.sId, this.students, this.user, this.school});

  TeacherParentsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    students = json['students'].cast<String>();
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    school = json['school'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['students'] = students;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['school'] = school;
    return data;
  }
}

class User {
  String? name;
  String? phone;
  String? role;
  String? sId;

  User({this.name, this.phone, this.role, this.sId});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    role = json['role'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['role'] = role;
    data['_id'] = sId;
    return data;
  }
}