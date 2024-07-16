import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/teacher/announcements/viewmodel/teacher_announcements_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/custom_textfield.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class TeacherAnnouncementsView extends StatefulWidget {
  const TeacherAnnouncementsView({super.key});

  @override
  State<TeacherAnnouncementsView> createState() =>
      _TeacherAnnouncementsViewState();
}

class _TeacherAnnouncementsViewState extends State<TeacherAnnouncementsView>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  var deleteIcon = false;
  var addIcon = false;
  var updateIcon = false;
  void isVisibleDelete() {
    deleteIcon = true;
    addIcon = false;
    updateIcon = false;
  }

  void isVisibleUpdate() {
    deleteIcon = false;
    addIcon = false;
    updateIcon = true;
  }

  void isVisibleAdd() {
    deleteIcon = false;
    addIcon = false;
    updateIcon = false;
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

  final TeacherAnnouncementsViewModel _teacherAnnouncementsViewModel =
      Get.put(TeacherAnnouncementsViewModel());

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
              _teacherAnnouncementsViewModel.clearTextField();
              _animationController.reverse();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text('Duyuru Ekle'),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: "Başlık",
                            height: 70,
                            controller: _teacherAnnouncementsViewModel
                                .addAnnouncementTitleController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hintText: "İçerik",
                            height: 170,
                            controller: _teacherAnnouncementsViewModel
                                .addAnnouncementcontentController,
                          )
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
                          _teacherAnnouncementsViewModel.postAnnouncement();
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

          Bubble(
            title: "Güncelle",
            iconColor: Colors.white,
            bubbleColor: ColorsP.primary,
            icon: Icons.update,
            titleStyle: const TextStyle(color: ColorsP.white),
            onPress: () {
              _animationController.reverse();
              setState(() {
                isVisibleUpdate();
              });
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
      appBar: DetailAppBar(title: "Duyurular"),
      body: Padding(
        padding: SizesP.pagePadding,
        child: Column(
          children: [
            Image.asset(
              "assets/images/teacherannouncement.png",
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
                    itemCount:
                        _teacherAnnouncementsViewModel.announcements!.length,
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
                            _teacherAnnouncementsViewModel
                                .announcements![index].title!,
                          ),
                          subtitle: Text(_teacherAnnouncementsViewModel
                              .announcements![index].content!),
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
                                                _teacherAnnouncementsViewModel
                                                    .deleteAnnouncements(
                                                        _teacherAnnouncementsViewModel
                                                            .announcements![
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
                            Visibility(
                                visible: updateIcon,
                                child: IconButton(
                                    onPressed: () {
                                      _teacherAnnouncementsViewModel
                                              .addAnnouncementTitleController
                                              .text =
                                          _teacherAnnouncementsViewModel
                                              .announcements![index].title!;
                                      _teacherAnnouncementsViewModel
                                              .addAnnouncementcontentController
                                              .text =
                                          _teacherAnnouncementsViewModel
                                              .announcements![index].content!;
                
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)),
                                            title: const Text('Duyuru Ekle'),
                                            content: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              child: Column(
                                                children: [
                                                  CustomTextField(
                                                    hintText: "Başlık",
                                                    height: 70,
                                                    controller:
                                                        _teacherAnnouncementsViewModel
                                                            .addAnnouncementTitleController,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomTextField(
                                                    hintText: "İçerik",
                                                    height: 170,
                                                    controller:
                                                        _teacherAnnouncementsViewModel
                                                            .addAnnouncementcontentController,
                                                  )
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
                                                  _teacherAnnouncementsViewModel
                                                      .putAnnouncement(
                                                          _teacherAnnouncementsViewModel
                                                              .announcements![
                                                                  index]
                                                              .id!);
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Kaydet'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.update,
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
