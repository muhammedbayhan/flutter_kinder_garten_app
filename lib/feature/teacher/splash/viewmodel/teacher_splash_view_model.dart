import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/teacher/splash/model/teacher_model.dart';

import 'package:kindergartenapp/feature/teacher/splash/service/teacher_service.dart';

class TeacherSplashViewModel extends GetxController {
  @override
  void onInit() {
    getTeacherInfo();
    super.onInit();
  }

  String? teacherSchoolId;
  String? teacherId;
  String? teacherclasses;
  String? teacherUserId;
  var teacherGender = "".obs;

  RxList<TeacherModel>? teacherInfo = <TeacherModel>[].obs; // Make it a RxList
  final TeacherService _teacherService = TeacherService();

  final box = GetStorage();

  Future<void> getTeacherInfo() async {
    final List<TeacherModel>? result =
        await _teacherService.getTeacherInfo(userId: box.read("userId"));
    if (result != null) {
      teacherInfo!.assignAll(result);
      print(teacherInfo!.length);
      teacherSchoolId = teacherInfo![0].school!;
      teacherUserId = teacherInfo![0].user!;
      teacherclasses = teacherInfo![0].classes!;
      teacherGender.value = teacherInfo![0].gender!;
      teacherId = teacherInfo![0].id!;
    } else {
      Get.snackbar("Hata", "Öğretmen Bulunamadı!");
    }
  }
}
