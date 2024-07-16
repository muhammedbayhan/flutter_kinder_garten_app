class TeacherModel {
  String? school;
  String? classes;
  String? user;
  String? gender;
  String? id;

  TeacherModel({this.school, this.classes, this.user, this.gender, this.id});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    classes = json['classes'];
    user = json['user'];
    gender = json['gender'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['school'] = school;
    data['classes'] = classes;
    data['user'] = user;
    data['gender'] = gender;
    data['id'] = id;
    return data;
  }
}