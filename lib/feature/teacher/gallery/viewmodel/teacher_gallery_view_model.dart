import 'dart:io';

import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/gallery/model/gallery_model.dart';
import 'package:kindergartenapp/feature/parent/gallery/service/gallery_service.dart';
import 'package:kindergartenapp/feature/teacher/gallery/service/teacher_gallery_service.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';

class TeacherGalleryViewModel extends GetxController {

  final TeacherSplashViewModel _teacherSplashViewModel =
      Get.put(TeacherSplashViewModel());

  RxList<GalleryModel>? gallery = <GalleryModel>[].obs;
  final GalleryService _galleryService = GalleryService();
  final TeacherGalleryService _teacherGalleryService = TeacherGalleryService();

  Future<void> getGallery() async {
    final List<GalleryModel>? result = await _galleryService.getGallery(schoolId: _teacherSplashViewModel.teacherSchoolId!);
    if (result != null) {
      gallery!.assignAll(result);
      print(gallery!.length);
    } else {
      Get.snackbar("Hata", "Rapor Bulunamadı!");
    }
  }

  

    Future<void> deleteImage(String id) async {
    try {
      await _teacherGalleryService.deleteImage(id);
      getGallery();
      update();

      Get.snackbar("Silindi", "Resim başarı ile silindi!");
    } catch (e) {
      Get.snackbar("Hata", "Resim Bulunamadı!");
    }
  }


    Future<void> postImage(File imageFile) async {
    try {
      await _teacherGalleryService.postImage(_teacherSplashViewModel.teacherSchoolId!,imageFile);
      getGallery();
      update();

      Get.snackbar("Eklendi", "Resim başarı ile eklendi!");
    } catch (e) {
      Get.snackbar("Hata", "Resim Bulunamadı!");
    }
  }


}
