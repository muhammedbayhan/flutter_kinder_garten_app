class StudentModel {
  String? name;
  String? age;
  String? parent;
  String? classes;
  String? school;
  String? gender;
  String? id;

  StudentModel(
      {this.name,
      this.age,
      this.parent,
      this.classes,
      this.school,
      this.gender,
      this.id});

  StudentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    parent = json['parent'];
    classes = json['classes'];
    school = json['school'];
    gender = json['gender'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['parent'] = parent;
    data['classes'] = classes;
    data['school'] = school;
    data['gender'] = gender;
    data['id'] = id;
    return data;
  }
}
