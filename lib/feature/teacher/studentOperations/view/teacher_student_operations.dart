import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/teacher/studentList/viewmodel/teacher_student_list_view_model.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/utility/routes/routes.dart';
import 'package:kindergartenapp/product/widgets/container_card.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';

class TeacherStudentOperationsView extends StatelessWidget {
  TeacherStudentOperationsView({super.key});
  final TeacherStudentListViewModel _teacherStudentListViewModel =
      Get.put(TeacherStudentListViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DetailAppBar(title: _teacherStudentListViewModel.studentName!),
        body: Padding(
          padding: SizesP.pagePadding,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              _OperationItem(
                operationTitle: "Gün Sonu Raporu",
                imgUrl: "assets/images/dailyreport.png",
                function: () {
                  Get.toNamed(AppRoutes.teacherDailyReport);
                },
              ),
              _OperationItem(
                operationTitle: "İlaç Takip",
                imgUrl: "assets/images/pill2.png",
                height: 95,
                function: () {
                  Get.toNamed(AppRoutes.teacherMedicationTracking);
                },
              ),
            ],
          ),
        ));
  }
}

class _OperationItem extends StatelessWidget {
  const _OperationItem(
      {required this.imgUrl,
      required this.operationTitle,
      this.height = 125,
      required this.function});
  final String imgUrl;
  final String operationTitle;
  final double height;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ContainerCard(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            imgUrl,
            height: height,
          ),
          Text(operationTitle),
        ],
      ),
      function: () {
        function();
      },
      height: 0.25,
      width: 0.5,
    );
  }
}
