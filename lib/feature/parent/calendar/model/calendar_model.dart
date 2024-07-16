class CalendarModel {
  String? lessonName;
  int? nameOfDay;
  int? hour;
  int? minute;
  int? lessonDuration;
  String? school;
  String? classes;
  String? id;

  CalendarModel(
      {this.lessonName,
      this.nameOfDay,
      this.hour,
      this.minute,
      this.lessonDuration,
      this.school,
      this.classes,
      this.id});

  CalendarModel.fromJson(Map<String, dynamic> json) {
    lessonName = json['lessonName'];
    nameOfDay = json['nameOfDay'];
    hour = json['hour'];
    minute = json['minute'];
    lessonDuration = json['lessonDuration'];
    school = json['school'];
    classes = json['classes'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lessonName'] = lessonName;
    data['nameOfDay'] = nameOfDay;
    data['hour'] = hour;
    data['minute'] = minute;
    data['lessonDuration'] = lessonDuration;
    data['school'] = school;
    data['classes'] = classes;
    data['id'] = id;
    return data;
  }
}