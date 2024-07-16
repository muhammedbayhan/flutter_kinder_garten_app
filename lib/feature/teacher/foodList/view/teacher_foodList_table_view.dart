import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergartenapp/feature/teacher/foodList/viewmodel/teacher_foodlist_view_model.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/mealWidgets/food_list_item.dart';

class TeacherFoodListTableView extends StatefulWidget {
  const TeacherFoodListTableView({super.key});

  @override
  State<TeacherFoodListTableView> createState() =>
      _TeacherFoodListTableViewState();
}

class _TeacherFoodListTableViewState extends State<TeacherFoodListTableView> {
  final TeacherFoodListViewModel _teacherFoodListViewModel =
      Get.put(TeacherFoodListViewModel());
      
  @override
  void initState() {
    _teacherFoodListViewModel.getSchoolFoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: SizesP.detailPagePadding,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Yemek Listesi",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 16, top: 16),
              //   // child: Row(
              //   //   mainAxisAlignment: MainAxisAlignment.center,
              //   //   children: [
              //   //     SvgPicture.asset("assets/svg/soup.svg"),
              //   //     SvgPicture.asset("assets/svg/spoon.svg"),
              //   //   ],
              //   // ),
              // ),
                 Center(
                   child: Padding(
                     padding: const EdgeInsets.all(16),
                     child: Image.asset(
                                     "assets/images/teacherFoodList.png",
                                     height: MediaQuery.of(context).size.height * 0.3,
                                   ),
                   ),
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
                      return FoodListItem(
                        date: Intl.withLocale(
                          "tr",
                          () => DateFormat('dd MMMM yyyy EEEE').format(
                              DateTime.parse(_teacherFoodListViewModel
                                  .foodLists![index].date!)),
                        ),
                        mainDish: _teacherFoodListViewModel
                            .foodLists![index].menu![0].mainDish!,
                        appetizer: _teacherFoodListViewModel
                            .foodLists![index].menu![0].appetizer!,
                        dessert: _teacherFoodListViewModel
                            .foodLists![index].menu![0].dessert!,
                        drink: _teacherFoodListViewModel
                            .foodLists![index].menu![0].drink!,
                        soup: _teacherFoodListViewModel
                            .foodLists![index].menu![0].soup!,
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
