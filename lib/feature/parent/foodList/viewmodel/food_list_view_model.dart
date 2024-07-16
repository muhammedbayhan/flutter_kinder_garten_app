import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/foodList/model/food_list_model.dart';
import 'package:kindergartenapp/feature/parent/foodList/service/food_list_service.dart';
import 'package:kindergartenapp/feature/parent/parentChildren/viewmodel/parent_children_view_model.dart';

class FoodListViewModel extends GetxController {



    final ParentChildrenViewModel _parentChildrenViewModel =
      Get.put(ParentChildrenViewModel());

  RxList<FoodListModel>? foodLists = <FoodListModel>[].obs; // Make it a RxList
  final FoodListService _foodListService = FoodListService();

  Future<void> getSchoolFoodList() async {
    final List<FoodListModel>? result =
        await _foodListService.getSchoolFoodList(schoolId:_parentChildrenViewModel.studentSchoolId!);
    if (result != null) {
      foodLists!.assignAll(result);
      print(foodLists!.length);
    } else {
      Get.snackbar("Hata", "Yemek Listesi Bulunamadı!");
    }
  }
}
