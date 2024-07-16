import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:kindergartenapp/feature/parent/medicationTracking/model/medication_tracking_model.dart';
import 'package:kindergartenapp/feature/parent/medicationTracking/service/medication_tracking_service.dart';

import 'package:kindergartenapp/feature/teacher/studentList/viewmodel/teacher_student_list_view_model.dart';
import 'package:kindergartenapp/feature/teacher/studentOperations/Operations/medicationTracking/service/teacher_medication_tracking_service.dart';

class TeacherMedicationTrackingViewModel extends GetxController {
  @override
  void onInit() {
    getMedicationTrackingStudent();
    super.onInit();
  }

  final TeacherStudentListViewModel _teacherStudentListViewModel =
      Get.put(TeacherStudentListViewModel());
  RxList<MedicationTrackingModel>? medicationTrackingList =
      <MedicationTrackingModel>[].obs; // Make it a RxList
  final MedicationTrackingService _medicationTrackingService =
      MedicationTrackingService();
  final TeacherMedicationTrackingService _teacherMedicationTrackingService =
      TeacherMedicationTrackingService();

  var addMedicine = TextEditingController().obs;
  var addDetail = TextEditingController().obs;

//GET(parentAnnouncementsService)
  Future<void> getMedicationTrackingStudent() async {
    final List<MedicationTrackingModel>? result =
        await _medicationTrackingService.getMedicationStudent(
            studentId: _teacherStudentListViewModel.studentId!);
    if (result != null) {
      medicationTrackingList!.assignAll(result);
      print(medicationTrackingList!.length);
    } else {
      Get.snackbar("Hata", "İlaç Listesi Bulunamadı!");
    }
  }

  //delete

  Future<void> deleteMedicationTracking(String id) async {
    try {
      await _teacherMedicationTrackingService.deleteMedicineTrack(id);
      getMedicationTrackingStudent();
      update();

      Get.snackbar("Silindi", "İlaç başarı ile silindi!");
    } catch (e) {
      Get.snackbar("Hata", "İlaç Bulunamadı!");
    }
  }

  // //post

  Future<void> postMedicationTracking() async {
    try {
      await _teacherMedicationTrackingService.postMedicineTrack(
          DateTime.now().toString(),
          addMedicine.value.text,
          addDetail.value.text,
          _teacherStudentListViewModel.studentId!,
          _teacherStudentListViewModel.studentSchoolId!);
      getMedicationTrackingStudent();
      update();
      addDetail.value.clear();
      addMedicine.value.clear();
      Get.snackbar("Eklendi", "İlaç başarı ile eklendi!");
    } catch (e) {
      Get.snackbar("Hata", "İlaç Bulunamadı!");
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
