import 'package:kindergartenapp/feature/parent/foodList/model/food_list_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class FoodListService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<FoodListModel>?> getSchoolFoodList(
      {required String schoolId}) async {
    var response = await _networkManager.dio.get(
      "/foodlists?school=$schoolId",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
      if (datas is List) {
        return datas.map((e) => FoodListModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
