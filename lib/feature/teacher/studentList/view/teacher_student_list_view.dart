import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/teacher/studentList/viewmodel/teacher_student_list_view_model.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:kindergartenapp/product/widgets/profile_avatar.dart';

class TeacherStudentListView extends StatelessWidget {
  TeacherStudentListView({super.key});
  final TeacherStudentListViewModel _teacherStudentListViewModel =
      Get.put(TeacherStudentListViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(title: "Öğrenci Listesi"),
      body: Obx(
        () => ListView.builder(
          itemCount: _teacherStudentListViewModel.students!.length,
          itemBuilder: (context, index) => Column(
            children: [
              InkWell(
                child: ListTile(
                    leading: ProfileAvatar(
                        imgUrl: _teacherStudentListViewModel
                                    .students![index].gender ==
                                "male"
                            ? "assets/svg/maleStudentAvatar.svg"
                            : "assets/svg/femaleStudentAvatar.svg",
                        sizeDevice: 0.0619),
                    title: Text(
                        _teacherStudentListViewModel.students![index].name!),
                    subtitle: Text(
                        "${_teacherStudentListViewModel.students![index].age!} Yaşında"),
                    trailing: const Icon(Icons.chevron_right)),
                onTap: () {
                  _teacherStudentListViewModel.studentName =
                      _teacherStudentListViewModel.students![index].name;
                  _teacherStudentListViewModel.studentAge =
                      _teacherStudentListViewModel.students![index].age;
                  _teacherStudentListViewModel.studentGender =
                      _teacherStudentListViewModel.students![index].gender;
                  _teacherStudentListViewModel.studentParentId =
                      _teacherStudentListViewModel.students![index].parent;
                  _teacherStudentListViewModel.studentSchoolId =
                      _teacherStudentListViewModel.students![index].school;
                  _teacherStudentListViewModel.studentClassesId =
                      _teacherStudentListViewModel.students![index].classes;
                  _teacherStudentListViewModel.studentId =
                      _teacherStudentListViewModel.students![index].id;

                  Get.toNamed(AppRoutes.teacherStudentOperations);
                },
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
