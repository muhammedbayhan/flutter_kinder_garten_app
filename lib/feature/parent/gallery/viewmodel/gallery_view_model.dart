import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/gallery/model/gallery_model.dart';
import 'package:kindergartenapp/feature/parent/gallery/service/gallery_service.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';

class GalleryViewModel extends GetxController {

  final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

  RxList<GalleryModel>? gallery = <GalleryModel>[].obs;
  final GalleryService _galleryService = GalleryService();

  Future<void> getGallery() async {
    final List<GalleryModel>? result = await _galleryService.getGallery(schoolId: _parentChildrenViewModel.studentSchoolId!);
    if (result != null) {
      gallery!.assignAll(result);
      print(gallery!.length);
    } else {
      Get.snackbar("Hata", "Rapor Bulunamadı!");
    }
  }
}
