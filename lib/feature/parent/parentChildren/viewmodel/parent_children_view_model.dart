import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/model/parent_children_model.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/service/parent_children_service.dart';

class ParentChildrenViewModel extends GetxController {
  @override
  void onInit() {
    getParentChildren();
    super.onInit();
  }

  String? studentName;
  String? studentAge;
  String? studentGender;
  String? studentParentId;
  String? studentSchoolId;
  String? studentClassesId;
  String? studentId;
  

  RxList<ParentChildrenModel>? children = <ParentChildrenModel>[].obs; // Make it a RxList
  final ParentChildrenService _parentChildrenService = ParentChildrenService();
  final box = GetStorage();

  Future<void> getParentChildren() async {
    final List<ParentChildrenModel>? result =
        await _parentChildrenService.getParentChildren(roleId: box.read("roleId"));
    if (result != null) {
      children!.assignAll(result);
      print(children!.length);
    } else {
      Get.snackbar("Hata", "Öğrenci Bulunamadı!");
    }
  }
}
