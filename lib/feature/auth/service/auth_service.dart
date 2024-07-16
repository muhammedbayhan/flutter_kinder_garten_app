import 'dart:io';

import 'package:kindergartenapp/feature/auth/model/login_model.dart';
import 'package:kindergartenapp/feature/auth/model/otp_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class AuthService {
  final NetworkManager _networkManager = NetworkManager.instance;


  Future<LoginModel?> loginPhone({required String phone}) async {
    Map<String, dynamic> json = {
      "phone": phone,
    };

    var response = await _networkManager.dio.post(
      "/auth/login",
      data: json,
    );
    if (response.statusCode == HttpStatus.ok) {
      var result = LoginModel.fromJson(response.data);
      print("Gelen Response ${response.data}");
      return result;
    } else {}
    return null;
  }

  Future<OtpModel?> loginOtp(
      {required String phone,
      required String token,
      required String otp}) async {
    Map<String, dynamic> json = {"phone": phone, "token": token, "otp": otp};

    var response = await _networkManager.dio.post(
      "/auth/verify-otp",
      data: json,
    );
    if (response.statusCode == HttpStatus.ok) {
      var result = OtpModel.fromJson(response.data);
      print("Gelen Response ${response.data}");
      return result;
    } else {}
    return null;
  }
}
