import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';
import 'package:kindergartenapp/product/widgets/drawer_item.dart';
import 'package:kindergartenapp/product/widgets/profile_avatar.dart';

class DrawerView extends StatelessWidget {
  DrawerView({super.key});
  final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsP.primary,
      body: SafeArea(
        child: Padding(
          padding: SizesP.detailPagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileAvatar(
                sizeDevice: 0.1,
                imgUrl: _parentChildrenViewModel.studentGender == "male"
                    ? "assets/svg/maleStudentAvatar.svg"
                    : "assets/svg/femaleStudentAvatar.svg",
              ),
              Text(_parentChildrenViewModel.studentName!,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorsP.white, fontWeight: FontWeight.bold)),
              const Divider(thickness: 2),
              DrawerItem(
                  title: "Duyurular",
                  icon: Icons.notifications,
                  function: () {
                    Get.toNamed(AppRoutes.announcementsView);
                  }),
              DrawerItem(
                  title: "Takvim",
                  icon: Icons.calendar_month,
                  function: () {
                    Get.toNamed(AppRoutes.calendar);
                  }),
              DrawerItem(
                  title: "Gün Sonu Raporu",
                  icon: Icons.bookmark,
                  function: () {
                    Get.toNamed(AppRoutes.dailyReport);
                  }),
              DrawerItem(
                  title: "İlaç Takip",
                  icon: Icons.medical_services,
                  function: () {
                    Get.toNamed(AppRoutes.medicationTracking);
                  }),
              DrawerItem(
                  title: "Öğrenci Seç",
                  icon: Icons.threesixty_rounded,
                  function: () {
                    Get.toNamed(AppRoutes.selectStudent);
                  }),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    child: Text('Çıkış Yap'),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: ColorsP.scaffoldColor,
                    ),
                    onPressed: () {
                      GetStorage().remove("name");
                      GetStorage().remove("phone");
                      GetStorage().remove("role");
                      GetStorage().remove("userId");
                      GetStorage().remove("roleId");
                      GetStorage().remove("accesToken");
                      Get.offAllNamed(AppRoutes.login);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
