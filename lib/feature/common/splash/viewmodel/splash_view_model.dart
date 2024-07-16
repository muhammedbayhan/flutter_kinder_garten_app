import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';

class SplashViewModel extends GetxController {
  final box = GetStorage();
  
  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (box.read("accesToken") != null) {
        if (box.read("role") == "teacher") {
          Get.offAllNamed(AppRoutes.teacherBaseScaffold);
        } else {
          Get.offAllNamed(AppRoutes.selectStudent);
        }
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
    super.onInit();
  }
}
