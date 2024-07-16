

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';
import 'package:kindergartenapp/product/widgets/container_card.dart';
import 'package:kindergartenapp/product/widgets/profile_avatar.dart';

class TeacherHomeView extends StatelessWidget {
   TeacherHomeView({super.key});

  final box = GetStorage();
    final TeacherSplashViewModel _teacherSplashViewModel = Get.put(TeacherSplashViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: SizesP.pagePadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Text("Merhaba,"),
                    Text(
                      box.read("name"),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
                child: Column(
              children: [
                Obx(()=> ProfileAvatar(imgUrl: _teacherSplashViewModel.teacherGender.value=="male"? "assets/svg/maleTeacherAvatar.svg": "assets/svg/femaleTeacherAvatar.svg",)),
               const Text("Öğretmen"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
               ContainerCard(widget:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/leaf.png"),
                     SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
                    const Text("Gün Sonu")
                  ],
                ),function: (){Get.toNamed(AppRoutes.teacherStudentList);},),
                ContainerCard(widget:
                   Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/settings.png"),
                     SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
                    const Text("İşlemler")
                  ],
                ),function: (){
       if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }

                },),
              ],
            )),
          ],
        ),
      ),
    ));
  }
}

