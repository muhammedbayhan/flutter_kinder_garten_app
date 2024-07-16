import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/announcements/model/announcements_model.dart';
import 'package:kindergartenapp/feature/parent/announcements/service/announcements_service.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';

class AnnouncementsViewModel extends GetxController {
  @override
  void onInit() {
    getSchoolAnnouncements();
    super.onInit();
  }

  final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

  RxList<AnnouncementsModel>? announcements = <AnnouncementsModel>[].obs;
  final AnnouncementsService _announcementsService = AnnouncementsService();

  Future<void> getSchoolAnnouncements() async {
    final List<AnnouncementsModel>? result =
        await _announcementsService.getSchoolAnnouncements(
            schoolId: _parentChildrenViewModel.studentSchoolId!);
    if (result != null) {
      announcements!.assignAll(result);
      print(announcements!.length);
    } else {
      Get.snackbar("Hata", "Rapor Bulunamadı!");
    }
  }
}
