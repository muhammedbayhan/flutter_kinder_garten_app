import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergartenapp/feature/parent/foodList/viewmodel/food_list_view_model.dart';
import 'package:kindergartenapp/product/constants/sizesP.dart';
import 'package:kindergartenapp/product/widgets/mealWidgets/food_list_item.dart';

class FoodListView extends StatefulWidget {
  const FoodListView({super.key});

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  final FoodListViewModel _foodListViewModel = Get.put(FoodListViewModel());
  @override
  void initState() {
    _foodListViewModel.getSchoolFoodList();

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
                    itemCount: _foodListViewModel.foodLists!.length,
                    itemBuilder: (context, index) {
                      return FoodListItem(
                        date: Intl.withLocale(
                          "tr",
                          () => DateFormat(
                            'dd MMMM yyyy EEEE',
                          ).format(DateTime.parse(
                              _foodListViewModel.foodLists![index].date!)),
                        ),
                        mainDish: _foodListViewModel
                            .foodLists![index].menu![0].mainDish!,
                        appetizer: _foodListViewModel
                            .foodLists![index].menu![0].appetizer!,
                        dessert: _foodListViewModel
                            .foodLists![index].menu![0].dessert!,
                        drink: _foodListViewModel
                            .foodLists![index].menu![0].drink!,
                        soup: _foodListViewModel
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
