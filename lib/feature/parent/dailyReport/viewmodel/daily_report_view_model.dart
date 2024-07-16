import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/dailyReport/model/daily_report_model.dart';
import 'package:kindergartenapp/feature/parent/dailyReport/service/daily_report_service.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';

class DailyReportViewModel extends GetxController {
  @override
  void onInit() {
    getDailyReportStudent();
    super.onInit();
  }

  final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

  RxList<DailyReportModel>? reports = <DailyReportModel>[].obs;
  final DailyReportService _dailyReportService = DailyReportService();

  Future<void> getDailyReportStudent() async {
    final List<DailyReportModel>? result = await _dailyReportService
        .getDailyReportStudent(studentId: _parentChildrenViewModel.studentId!);
    if (result != null) {
      reports!.assignAll(result);
      print(reports!.length);
    } else {
      Get.snackbar("Hata", "Rapor Bulunamadı!");
    }
  }
}
