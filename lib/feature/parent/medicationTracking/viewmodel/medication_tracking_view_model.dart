import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/medicationTracking/model/medication_tracking_model.dart';
import 'package:kindergartenapp/feature/parent/medicationTracking/service/medication_tracking_service.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';

class MedicationTrackingViewModel extends GetxController {
  @override
  void onInit() {
    getDailyReportStudent();
    super.onInit();
  }
    final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

  RxList<MedicationTrackingModel>? medicines = <MedicationTrackingModel>[].obs; // Make it a RxList
  final MedicationTrackingService _medicationTrackingService = MedicationTrackingService();

  Future<void> getDailyReportStudent() async {
    final List<MedicationTrackingModel>? result =
        await _medicationTrackingService.getMedicationStudent(studentId: _parentChildrenViewModel.studentId!);
    if (result != null) {
      medicines!.assignAll(result);
      print(medicines!.length);
    } else {
      Get.snackbar("Hata", "İlaç Bulunamadı!");
    }
  }
}
