class AnnouncementsModel {
  String? title;
  String? content;
  String? school;
  String? id;

  AnnouncementsModel({this.title, this.content, this.school, this.id});

  AnnouncementsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    school = json['school'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['school'] = school;
    data['id'] = id;
    return data;
  }
}