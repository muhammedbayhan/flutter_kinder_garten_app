import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/container_card.dart';
import 'package:kindergartenapp/product/widgets/profile_avatar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final box = GetStorage();
  final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());
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
                    const Text("Merhaba,"),
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
                ProfileAvatar(
                  imgUrl: _parentChildrenViewModel.studentGender == "male"
                      ? "assets/svg/maleStudentAvatar.svg"
                      : "assets/svg/femaleStudentAvatar.svg",
                ),
                Text(_parentChildrenViewModel.studentName!),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ContainerCard(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/leaf.png"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Text("Gün Sonu")
                    ],
                  ),
                  function: () {
                    Get.toNamed("dailyReport");
                  },
                ),
                ContainerCard(
                  widget: Image.asset("assets/images/links.png"),
                  function: () {
                    if (ZoomDrawer.of(context)!.isOpen()) {
                      ZoomDrawer.of(context)!.close();
                    } else {
                      ZoomDrawer.of(context)!.open();
                    }
                  },
                ),
              ],
            )),
          ],
        ),
      ),
    ));
  }
}
