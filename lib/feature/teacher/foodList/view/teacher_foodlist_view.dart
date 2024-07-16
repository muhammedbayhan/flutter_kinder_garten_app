import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergartenapp/feature/teacher/foodList/viewmodel/teacher_foodlist_view_model.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/custom_textfield.dart';
import 'package:kindergartenapp/product/widgets/detail_appbar.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class TeacherFoodListView extends StatefulWidget {
  const TeacherFoodListView({super.key});

  @override
  State<TeacherFoodListView> createState() => _TeacherFoodListViewState();
}

class _TeacherFoodListViewState extends State<TeacherFoodListView>
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

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (picked != null) {
      _teacherFoodListViewModel.showaddFoodDateController.value.text =
          picked.toString().split(" ")[0];
      _teacherFoodListViewModel.addFoodDateController.value.text =
          picked.toString();
    }
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

  final TeacherFoodListViewModel _teacherFoodListViewModel =
      Get.put(TeacherFoodListViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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

                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.8,
                      child: Padding(
                        padding: SizesP.pagePadding,
                        child: Obx(
                          () => Column(
                            children: [
                              CustomTextField(
                                  maxLines: 1,
                                  expands: false,
                                  hintText: "Ana Yemek",
                                  height: 50,
                                  controller: _teacherFoodListViewModel
                                      .addFoodMainDishController),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                  maxLines: 1,
                                  expands: false,
                                  hintText: "Meze",
                                  height: 50,
                                  controller: _teacherFoodListViewModel
                                      .addFoodAppetizerController),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                  maxLines: 1,
                                  expands: false,
                                  hintText: "Çorba",
                                  height: 50,
                                  controller: _teacherFoodListViewModel
                                      .addFoodSoupController),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                  maxLines: 1,
                                  expands: false,
                                  hintText: "Tatlı",
                                  height: 50,
                                  controller: _teacherFoodListViewModel
                                      .addFoodDessertController),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                  maxLines: 1,
                                  expands: false,
                                  hintText: "İçecek",
                                  height: 50,
                                  controller: _teacherFoodListViewModel
                                      .addFoodDrinkController),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: _teacherFoodListViewModel
                                    .showaddFoodDateController.value,
                                decoration: const InputDecoration(
                                    labelText: 'Tarih',
                                    filled: true,
                                    prefixIcon: Icon(Icons.calendar_today),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsP.fashionableGrey))),
                                readOnly: true,
                                onTap: () {
                                  selectDate();
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Vazgeç")),
                                  TextButton(
                                      onPressed: () {
                                        _teacherFoodListViewModel
                                            .postAnnouncement();
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Kaydet")),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),

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
      appBar: DetailAppBar(title: "Yemek Listesi"),
      body: Padding(
        padding: SizesP.detailPagePadding,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/teacherFoodList.png",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Divider(
                thickness: 3,
              ),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _teacherFoodListViewModel.foodLists!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ListTile(
                          title: Text(
                            Intl.withLocale(
                              "tr",
                              () => DateFormat('dd MMMM yyyy EEEE').format(
                                  DateTime.parse(_teacherFoodListViewModel
                                      .foodLists![index].date!)),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ana Yemek: ${_teacherFoodListViewModel.foodLists![index].menu![0].mainDish!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsP.fashionableGrey),
                                ),
                                Text(
                                  "Meze: ${_teacherFoodListViewModel.foodLists![index].menu![0].appetizer!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsP.fashionableGrey),
                                ),
                                Text(
                                  "Çorba: ${_teacherFoodListViewModel.foodLists![index].menu![0].soup!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsP.fashionableGrey),
                                ),
                                Text(
                                  "Tatlı: ${_teacherFoodListViewModel.foodLists![index].menu![0].dessert}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsP.fashionableGrey),
                                ),
                                Text(
                                  "İçecek: ${_teacherFoodListViewModel.foodLists![index].menu![0].drink!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsP.fashionableGrey),
                                ),
                              ],
                            ),
                          ),
                          trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                                  iconData:
                                                      Icons.cancel_outlined,
                                                  textStyle: const TextStyle(
                                                      color: Colors.grey),
                                                  iconColor: Colors.grey,
                                                ),
                                                IconsButton(
                                                  onPressed: () {
                                                    _teacherFoodListViewModel
                                                        .deleteAnnouncements(
                                                            _teacherFoodListViewModel
                                                                .foodLists![
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
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            shape:
                                                const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                            builder: (BuildContext context) {
                                              return FractionallySizedBox(
                                                heightFactor: 0.8,
                                                child: Padding(
                                                  padding: SizesP.pagePadding,
                                                  child: Obx(
                                                    () => Column(
                                                      children: [
                                                        CustomTextField(
                                                            maxLines: 1,
                                                            expands: false,
                                                            hintText:
                                                                "Ana Yemek",
                                                            height: 50,
                                                            controller:
                                                                _teacherFoodListViewModel
                                                                    .addFoodMainDishController),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        CustomTextField(
                                                            maxLines: 1,
                                                            expands: false,
                                                            hintText: "Meze",
                                                            height: 50,
                                                            controller:
                                                                _teacherFoodListViewModel
                                                                    .addFoodAppetizerController),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        CustomTextField(
                                                            maxLines: 1,
                                                            expands: false,
                                                            hintText: "Çorba",
                                                            height: 50,
                                                            controller:
                                                                _teacherFoodListViewModel
                                                                    .addFoodSoupController),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        CustomTextField(
                                                            maxLines: 1,
                                                            expands: false,
                                                            hintText: "Tatlı",
                                                            height: 50,
                                                            controller:
                                                                _teacherFoodListViewModel
                                                                    .addFoodDessertController),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        CustomTextField(
                                                            maxLines: 1,
                                                            expands: false,
                                                            hintText:
                                                                "İçecek",
                                                            height: 50,
                                                            controller:
                                                                _teacherFoodListViewModel
                                                                    .addFoodDrinkController),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextField(
                                                          controller:
                                                              _teacherFoodListViewModel
                                                                  .showaddFoodDateController
                                                                  .value,
                                                          decoration: const InputDecoration(
                                                              labelText:
                                                                  'Tarih',
                                                              filled: true,
                                                              prefixIcon:
                                                                  Icon(Icons
                                                                      .calendar_today),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              ColorsP.fashionableGrey))),
                                                          readOnly: true,
                                                          onTap: () {
                                                            selectDate();
                                                          },
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            TextButton(
                                                                onPressed:
                                                                    () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    "Vazgeç")),
                                                            TextButton(
                                                                onPressed:
                                                                    () {
                                                                  _teacherFoodListViewModel.putAnnouncement(_teacherFoodListViewModel
                                                                      .foodLists![
                                                                          index]
                                                                      .id!);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    "Kaydet")),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
