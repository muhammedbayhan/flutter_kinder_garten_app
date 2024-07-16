class DailyReportModel {
  String? date;
  String? content;
  String? student;
  String? school;
  String? id;

  DailyReportModel(
      {this.date, this.content, this.student, this.school, this.id});

  DailyReportModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    content = json['content'];
    student = json['student'];
    school = json['school'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['content'] = content;
    data['student'] = student;
    data['school'] = school;
    data['id'] = id;
    return data;
  }
}