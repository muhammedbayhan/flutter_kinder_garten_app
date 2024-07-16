import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';
import 'package:kindergartenapp/product/widgets/container_card.dart';
import 'package:kindergartenapp/product/widgets/profile_avatar.dart';

class ParentChildrenView extends StatelessWidget {
  ParentChildrenView({Key? key}) : super(key: key);

  final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsP.primary,
        onPressed: (){
                    GetStorage().remove("name");
                    GetStorage().remove("phone");
                    GetStorage().remove("role");
                    GetStorage().remove("userId");
                    GetStorage().remove("roleId");
                    GetStorage().remove("accesToken");
                    Get.offAllNamed(AppRoutes.login);
      },child:const Icon(Icons.arrow_back),),
      appBar: AppBar(
        title: Text("Öğrenci Seç",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: SizesP.pagePadding,
        child: Obx(() {
          if (_parentChildrenViewModel.children == null) {
            return const CircularProgressIndicator();
          } else {
            return GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: _parentChildrenViewModel.children!.length,
              itemBuilder: (context, index) => ContainerCard(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileAvatar(imgUrl: _parentChildrenViewModel.children![index].gender=="male"?  "assets/svg/maleStudentAvatar.svg": "assets/svg/femaleStudentAvatar.svg",),
                    Text("${_parentChildrenViewModel.children![index].name}"),
                  ],
                ),
                function: () {
                  _parentChildrenViewModel.studentName=_parentChildrenViewModel.children![index].name;
                  _parentChildrenViewModel.studentAge=_parentChildrenViewModel.children![index].age;
                  _parentChildrenViewModel.studentGender=_parentChildrenViewModel.children![index].gender;
                  _parentChildrenViewModel.studentParentId=_parentChildrenViewModel.children![index].parent;
                  _parentChildrenViewModel.studentSchoolId=_parentChildrenViewModel.children![index].school;
                  _parentChildrenViewModel.studentClassesId=_parentChildrenViewModel.children![index].classes;
                  _parentChildrenViewModel.studentId=_parentChildrenViewModel.children![index].id;
                  Get.toNamed(AppRoutes.baseScaffold);
                },
                height: 0.25,
                width: 0.5,
              ),
            );
          }
        }),
      ),
    );
  }
}
