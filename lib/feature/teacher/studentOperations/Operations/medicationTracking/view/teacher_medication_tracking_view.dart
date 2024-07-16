import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergartenapp/feature/teacher/studentList/viewmodel/teacher_student_list_view_model.dart';
import 'package:kindergartenapp/feature/teacher/studentOperations/Operations/medicationTracking/viewmodel/teacher_medication_tracking_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/custom_textfield.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:kindergartenapp/product/widgets/profile_avatar.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class TeacherMedicationView extends StatefulWidget {
  const TeacherMedicationView({super.key});

  @override
  State<TeacherMedicationView> createState() => _TeacherMedicationViewState();
}

class _TeacherMedicationViewState extends State<TeacherMedicationView>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  var deleteIcon = false;
  var addIcon = false;
  void isVisibleDelete() {
    deleteIcon = true;
    addIcon = false;
  }

  void isVisibleAdd() {
    deleteIcon = false;
    addIcon = false;
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  final TeacherMedicationTrackingViewModel _teacherMedicationTrackingViewModel =
      Get.put(TeacherMedicationTrackingViewModel());
  final TeacherStudentListViewModel _teacherStudentListViewModel =
      Get.put(TeacherStudentListViewModel());

  // final TeacherAnnouncementsViewModel _teacherAnnouncementsViewModel =
  //     Get.put(TeacherAnnouncementsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          // Floating action menu item
          Bubble(
            title: "Sil",
            iconColor: Colors.white,
            bubbleColor: ColorsP.primary,
            icon: Icons.delete,
            titleStyle: const TextStyle(color: ColorsP.white),
            onPress: () {
              _animationController.reverse();
              setState(() {
                isVisibleDelete();
              });
            },
          ),
          Bubble(
            title: "Ekle",
            iconColor: Colors.white,
            bubbleColor: ColorsP.primary,
            icon: Icons.add,
            titleStyle: const TextStyle(color: ColorsP.white),
            onPress: () {
              setState(() {
                isVisibleAdd();
              });
              _animationController.reverse();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text('İlaç raporu ekle'),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                              hintText: "İlaç Adı",
                              height: 56,
                              controller: _teacherMedicationTrackingViewModel
                                  .addMedicine.value),
                          CustomTextField(
                              hintText: "Detay",
                              height: 175,
                              controller: _teacherMedicationTrackingViewModel
                                  .addDetail.value),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Kapat'),
                      ),
                      TextButton(
                        onPressed: () {
                          _teacherMedicationTrackingViewModel
                              .postMedicationTracking();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Kaydet'),
                      ),
                    ],
                  );
                },
              );
            },
          ),

          // Floating action menu item
        ],

        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),

        // Floating Action button Icon color
        iconColor: ColorsP.white,

        // Flaoting Action button Icon
        iconData: Icons.settings,
        backGroundColor: ColorsP.primary,
      ),
      resizeToAvoidBottomInset: false,
      appBar: const DetailAppBar(title: "İlaç Takip"),
      body: Padding(
        padding: SizesP.pagePadding,
        child: Column(
          children: [
            ProfileAvatar(
              sizeDevice: 0.2,
              imgUrl: _teacherStudentListViewModel.studentGender == "male"
                  ? "assets/svg/maleStudentAvatar.svg"
                  : "assets/svg/femaleStudentAvatar.svg",
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              _teacherStudentListViewModel.studentName!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(
                thickness: 4,
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _teacherMedicationTrackingViewModel
                        .medicationTrackingList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: Text("${index + 1}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: ColorsP.fashionableGrey)),
                          title: Text(
                            Intl.withLocale(
                              "tr",
                              () => DateFormat('dd MMMM yyyy EEEE')
                                  .format(DateTime.parse(
                                _teacherMedicationTrackingViewModel
                                    .medicationTrackingList![index].date!,
                              )),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_teacherMedicationTrackingViewModel
                                  .medicationTrackingList![index].medicine!),
                              Text(_teacherMedicationTrackingViewModel
                                  .medicationTrackingList![index].detail!),
                            ],
                          ),
                          trailing: Column(children: [
                            Visibility(
                                visible: deleteIcon,
                                child: IconButton(
                                    onPressed: () {
                                      Dialogs.materialDialog(
                                          msg:
                                              'Emin misin? Bu işlemi geri alamazsın!',
                                          title: "Sil",
                                          color: Colors.white,
                                          context: context,
                                          actions: [
                                            IconsOutlineButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              text: 'Vazgeç',
                                              iconData: Icons.cancel_outlined,
                                              textStyle: const TextStyle(
                                                  color: Colors.grey),
                                              iconColor: Colors.grey,
                                            ),
                                            IconsButton(
                                              onPressed: () {
                                                _teacherMedicationTrackingViewModel
                                                    .deleteMedicationTracking(
                                                        _teacherMedicationTrackingViewModel
                                                            .medicationTrackingList![
                                                                index]
                                                            .id!);
                                                Navigator.pop(context);
                                              },
                                              text: 'Sil',
                                              iconData: Icons.delete,
                                              color: ColorsP.primary,
                                              textStyle: const TextStyle(
                                                  color: Colors.white),
                                              iconColor: Colors.white,
                                            ),
                                          ]);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: ColorsP.primary,
                                    ))),
                          ]),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
