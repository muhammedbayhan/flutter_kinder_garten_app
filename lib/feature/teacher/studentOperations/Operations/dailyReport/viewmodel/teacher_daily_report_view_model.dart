import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/dailyReport/model/daily_report_model.dart';
import 'package:kindergartenapp/feature/parent/dailyReport/service/daily_report_service.dart';

import 'package:kindergartenapp/feature/teacher/studentList/viewmodel/teacher_student_list_view_model.dart';
import 'package:kindergartenapp/feature/teacher/studentOperations/Operations/dailyReport/service/teacher_daily_report_service.dart';

class TeacherDailyReportViewModel extends GetxController {
  @override
  void onInit() {
    getDailyReportStudent();
    super.onInit();
  }

  final TeacherStudentListViewModel _teacherStudentListViewModel =
      Get.put(TeacherStudentListViewModel());
  RxList<DailyReportModel>? reports =
      <DailyReportModel>[].obs; 
  final DailyReportService _dailyReportService = DailyReportService();

  final TeacherDailyReportService _teacherDailyReportService =
      TeacherDailyReportService();

  var addContent = TextEditingController().obs;

//GET(parentDailyReportService)
  Future<void> getDailyReportStudent() async {
    final List<DailyReportModel>? result =
        await _dailyReportService.getDailyReportStudent(
            studentId: _teacherStudentListViewModel.studentId!);
    if (result != null) {
      reports!.assignAll(result);
      print(reports!.length);
    } else {
      Get.snackbar("Hata", "Rapor Bulunamadı!");
    }
  }

  //delete

  Future<void> deleteReport(String id) async {
    try {
      await _teacherDailyReportService.deleteDailyReport(id);
      getDailyReportStudent();
      update();

      Get.snackbar("Silindi", "Rapor başarı ile silindi!");
    } catch (e) {
      Get.snackbar("Hata", "Rapor Bulunamadı!");
    }
  }

  // //post

  Future<void> postReport() async {
    try {
      await _teacherDailyReportService.postDailyReport(
          DateTime.now().toString(),
          addContent.value.text,
          _teacherStudentListViewModel.studentId!,
          _teacherStudentListViewModel.studentSchoolId!);
      getDailyReportStudent();
      update();
      addContent.value.clear();
      Get.snackbar("Eklendi", "Rapor başarı ile eklendi!");
    } catch (e) {
      Get.snackbar("Hata", "Rapor Bulunamadı!");
    }
  }

  // //put
  // Future<void> putAnnouncement(String id) async {
  //   try {
  //     await _teacherDailyReportService.putDailyReport(date, content, studentId, schoolId, id)
  //     getDailyReportStudent();
  //     update();

  //     Get.snackbar("Eklendi", "Yemek başarı ile Güncellendi!");
  //   } catch (e) {
  //     Get.snackbar("Hata", "Yemek Bulunamadı!");
  //   }
  // }
}
