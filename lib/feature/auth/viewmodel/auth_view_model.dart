import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/auth/service/auth_service.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';

class AuthViewModel extends GetxController {
  final AuthService _authService = AuthService();
  final box = GetStorage();
  var phoneController = TextEditingController();
  String? token;
  String? otpCode;


  void loginPhone() {
    _authService
        .loginPhone(phone: phoneController.value.text.replaceAll(' ', ''))
        .then((value) {
      if (value != null) {
        token = value.token;
        Get.toNamed(AppRoutes.verification);
      } else {
        Get.snackbar("Hata", "Telefon numarası sistemde kayıtlı değil!");
      }
    });
  }

  void loginOtp() {
    _authService
        .loginOtp(
      phone: phoneController.value.text.replaceAll(' ', ''),
      otp: otpCode!,
      token: token!,
    )
        .then((value) {
      if (value != null) {
        box.write("name", value.user!.name);
        box.write("phone", value.user!.phone);
        box.write("role", value.user!.role);
        box.write("userId", value.user!.id);
        box.write("roleId", value.user!.roleId);
        box.write("accesToken", value.accessToken);

        // print("ACCES TOKEN: ${box.read("accesToken")}");
     

        Get.offAllNamed(AppRoutes.splash);
      } else {
        Get.snackbar("Hata", "Doğrulama Kodu Yanlış!");
      }
    });
  }
}
