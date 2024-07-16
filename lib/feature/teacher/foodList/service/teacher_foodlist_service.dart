import 'package:kindergartenapp/product/network/network_manager.dart';

class TeacherFoodListService {
  final NetworkManager _networkManager = NetworkManager.instance;


//Delete
  
  Future<void> deleteFoodItem(String id) async {
    try {
      final response = await _networkManager.dio.delete("/foodlists/$id",);

      if (response.statusCode == 200) {
        print("Silindi");
      }
    } catch (e) {
      print(e);
    }
  }

//post
   Future<void> postFoodItem(String date,String mainDish, String appetizer,String soup,String dessert,String drink,String schoolId) async {
    try {
      final response =await _networkManager.dio.post("/foodlists",
          data: 
          {
  "date": date,
  "menu": [
    {
      "main_dish": mainDish,
      "appetizer": appetizer,
      "soup": soup,
      "dessert": dessert,
      "drink": drink
    }
  ],
  "school": schoolId
});

      if (response.statusCode == 200) {
        print("Eklendi");
 
      }
    } catch (e) {
      print(e);
    }
  }


//put
   Future<void> putFoodItem(String date,String mainDish, String appetizer,String soup,String dessert,String drink,String id,String schoolId) async {
    try {
      final response =await _networkManager.dio.put("/foodlists/$id",
          data: 
          {
  "date": date,
  "menu": [
    {
      "main_dish": mainDish,
      "appetizer": appetizer,
      "soup": soup,
      "dessert": dessert,
      "drink": drink
    }
  ],
  "school": schoolId
});

      if (response.statusCode == 200) {
        print("Eklendi");
 
      }
    } catch (e) {
      print(e);
    }
  }
}
