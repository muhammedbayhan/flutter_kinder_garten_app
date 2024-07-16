class MedicationTrackingModel {
  String? date;
  String? medicine;
  String? detail;
  String? student;
  String? school;
  String? id;

  MedicationTrackingModel(
      {this.date,
      this.medicine,
      this.detail,
      this.student,
      this.school,
      this.id});

  MedicationTrackingModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    medicine = json['medicine'];
    detail = json['detail'];
    student = json['student'];
    school = json['school'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['medicine'] = medicine;
    data['detail'] = detail;
    data['student'] = student;
    data['school'] = school;
    data['id'] = id;
    return data;
  }
}