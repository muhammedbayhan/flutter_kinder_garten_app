class GalleryModel {
  String? user;
  String? school;
  String? type;
  String? url;
  String? id;

  GalleryModel({this.user, this.school, this.type, this.url, this.id});

  GalleryModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    school = json['school'];
    type = json['type'];
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['school'] = school;
    data['type'] = type;
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}