import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kindergartenapp/feature/parent/foodList/model/food_list_model.dart';
import 'package:kindergartenapp/feature/parent/foodList/service/food_list_service.dart';
import 'package:kindergartenapp/feature/teacher/foodList/service/teacher_foodlist_service.dart';
import 'package:kindergartenapp/feature/teacher/splash/viewmodel/teacher_splash_view_model.dart';

class TeacherFoodListViewModel extends GetxController {
  @override
  void onInit() {
    getSchoolFoodList();
    super.onInit();
  }

  final TeacherSplashViewModel _teacherSplashViewModel =
      Get.put(TeacherSplashViewModel());

  RxList<FoodListModel>? foodLists = <FoodListModel>[].obs; // Make it a RxList
  final FoodListService _foodListService = FoodListService();

  final TeacherFoodListService _teacherFoodListService =
      TeacherFoodListService();
//Post input (Food)
  var showaddFoodDateController = TextEditingController().obs;
  var addFoodDateController = TextEditingController().obs;
  var addFoodMainDishController = TextEditingController();
  var addFoodAppetizerController = TextEditingController();
  var addFoodSoupController = TextEditingController();
  var addFoodDessertController = TextEditingController();
  var addFoodDrinkController = TextEditingController();

//GET(parentFoodService)
  Future<void> getSchoolFoodList() async {
    final List<FoodListModel>? result = await _foodListService
        .getSchoolFoodList(schoolId: _teacherSplashViewModel.teacherSchoolId!);
    if (result != null) {
      foodLists!.assignAll(result);
      print(foodLists!.length);
    } else {
      Get.snackbar("Hata", "Yemek Bulunamadı!");
    }
  }

  //delete

  Future<void> deleteAnnouncements(String id) async {
    try {
      await _teacherFoodListService.deleteFoodItem(id);
      getSchoolFoodList();
      update();
      clearTextField();

      Get.snackbar("Silindi", "Yemek başarı ile silindi!");
    } catch (e) {
      Get.snackbar("Hata", "Yemek Bulunamadı!");
    }
  }

  //post

  Future<void> postAnnouncement() async {
    try {
      await _teacherFoodListService.postFoodItem(
          addFoodDateController.value.text,
          addFoodMainDishController.text,
          addFoodAppetizerController.text,
          addFoodSoupController.text,
          addFoodDessertController.text,
          addFoodDrinkController.text,
          _teacherSplashViewModel.teacherSchoolId!);
      getSchoolFoodList();
      update();
      clearTextField();

      Get.snackbar("Eklendi", "Yemek başarı ile eklendi!");
    } catch (e) {
      Get.snackbar("Hata", "Yemek Bulunamadı!");
    }
  }

  //put
  Future<void> putAnnouncement(String id) async {
    try {
      await _teacherFoodListService.putFoodItem(
          addFoodDateController.value.text,
          addFoodMainDishController.text,
          addFoodAppetizerController.text,
          addFoodSoupController.text,
          addFoodDessertController.text,
          addFoodDrinkController.text,
          _teacherSplashViewModel.teacherSchoolId!,
          id);
      getSchoolFoodList();
      update();
      clearTextField();

      Get.snackbar("Eklendi", "Yemek başarı ile Güncellendi!");
    } catch (e) {
      Get.snackbar("Hata", "Yemek Bulunamadı!");
    }
  }

  void clearTextField() {
    showaddFoodDateController.value.clear();
    addFoodDateController.value.clear();
    addFoodMainDishController.clear();
    addFoodAppetizerController.clear();
    addFoodSoupController.clear();
    addFoodDessertController.clear();
    addFoodDrinkController.clear();
  }
}
