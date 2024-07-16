import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/common/splash/viewmodel/splash_view_model.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
   SplashView({super.key});
    // ignore: unused_field
    final SplashViewModel _splashViewModel = Get.put(SplashViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset("assets/animations/teacherSplash.json")),
    );
  }
}
