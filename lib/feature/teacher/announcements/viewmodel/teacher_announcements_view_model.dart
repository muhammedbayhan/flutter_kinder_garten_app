import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/announcements/model/announcements_model.dart';
import 'package:kindergartenapp/feature/parent/announcements/service/announcements_service.dart';
import 'package:kindergartenapp/feature/teacher/announcements/service/teacher_announcements_service.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';

class TeacherAnnouncementsViewModel extends GetxController {
  @override
  void onInit() {
    getSchoolAnnouncements();
    super.onInit();
  }

  final TeacherSplashViewModel _teacherSplashViewModel =
      Get.put(TeacherSplashViewModel());

  RxList<AnnouncementsModel>? announcements =
      <AnnouncementsModel>[].obs; // Make it a RxList
  final AnnouncementsService _announcementsService = AnnouncementsService();
  final TeacherAnnouncementsService _teacherAnnouncementsService =
      TeacherAnnouncementsService();

//Post input (announcements)
  var addAnnouncementTitleController = TextEditingController();
  var addAnnouncementcontentController = TextEditingController();

//GET(parentAnnouncementsService)
  Future<void> getSchoolAnnouncements() async {
    final List<AnnouncementsModel>? result =
        await _announcementsService.getSchoolAnnouncements(
            schoolId: _teacherSplashViewModel.teacherSchoolId!);
    if (result != null) {
      announcements!.assignAll(result);
      print("${announcements!.length}--AnnouncementListLength");
    } else {
      Get.snackbar("Hata", "Duyuru Bulunamadı!");
    }
  }

  //delete

  Future<void> deleteAnnouncements(String id) async {
    try {
      await _teacherAnnouncementsService.deleteAnnouncement(id);
      getSchoolAnnouncements();
      update();

      Get.snackbar("Silindi", "Duyuru başarı ile silindi!");
    } catch (e) {
      Get.snackbar("Hata", "Duyuru Bulunamadı!");
    }
  }

  //post

  Future<void> postAnnouncement() async {
    try {
      await _teacherAnnouncementsService.postAnnouncement(
          addAnnouncementTitleController.text,
          addAnnouncementcontentController.text,
          _teacherSplashViewModel.teacherSchoolId!);
      getSchoolAnnouncements();
      update();
      clearTextField();
      Get.snackbar("Eklendi", "Duyuru başarı ile eklendi!");
    } catch (e) {
      Get.snackbar("Hata", "Duyuru Bulunamadı!");
    }
  }

  //put
  Future<void> putAnnouncement(String id) async {
    try {
      await _teacherAnnouncementsService.putAnnouncement(
          addAnnouncementTitleController.text,
          addAnnouncementcontentController.text,
          _teacherSplashViewModel.teacherSchoolId!,
          id);
      getSchoolAnnouncements();
      update();
      clearTextField();

      Get.snackbar("Eklendi", "Duyuru başarı ile Güncellendi!");
    } catch (e) {
      Get.snackbar("Hata", "Duyuru Bulunamadı!");
    }
  }

  void clearTextField() {
    addAnnouncementTitleController.clear();
    addAnnouncementcontentController.clear();
  }
}
