import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';
import 'package:kindergartenapp/product/widgets/drawer_item.dart';
import 'package:kindergartenapp/product/widgets/profile_avatar.dart';

class TeacherDrawerView extends StatelessWidget {
   TeacherDrawerView({super.key});
  final box = GetStorage();
    final TeacherSplashViewModel _teacherSplashViewModel = Get.put(TeacherSplashViewModel());

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
              Obx(()=> ProfileAvatar(imgUrl: _teacherSplashViewModel.teacherGender.value=="male"? "assets/svg/maleTeacherAvatar.svg": "assets/svg/femaleTeacherAvatar.svg",)),
                Text(box.read("name"),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorsP.white, fontWeight: FontWeight.bold)),
            const  Divider(thickness: 2),
              DrawerItem(title: "Öğrenci İşlemleri", icon: Icons.groups,function: (){Get.toNamed(AppRoutes.teacherStudentList);}),
              DrawerItem(title: "Takvim", icon: Icons.calendar_month,function: (){Get.toNamed(AppRoutes.teacherCalendar);}),
              DrawerItem(title: "Duyuru", icon: Icons.bookmark,function: (){Get.toNamed(AppRoutes.teacherAnnouncements);}),
              DrawerItem(title: "Galeri", icon: Icons.photo,function: (){Get.toNamed(AppRoutes.teacherGallerySettings);}),
              DrawerItem(title: "Yemek Listesi", icon: Icons.list,function: (){Get.toNamed(AppRoutes.teacherFoodList);}),
           
             SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                
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
                  },
                
                  child: const Text('Çıkış Yap')),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
