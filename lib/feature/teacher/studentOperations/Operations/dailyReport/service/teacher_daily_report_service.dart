import 'package:kindergartenapp/product/network/network_manager.dart';

class TeacherDailyReportService {
  final NetworkManager _networkManager = NetworkManager.instance;

//Delete

  Future<void> deleteDailyReport(String id) async {
    try {
      final response = await _networkManager.dio.delete(
        "/dailyreports/$id",
      );

      if (response.statusCode == 200) {
        print("Silindi");
      }
    } catch (e) {
      print(e);
    }
  }

//post
  Future<void> postDailyReport(
      String date, String content, String studentId, String schoolId) async {
    try {
      final response = await _networkManager.dio.post("/dailyreports", data: {
        "date": date,
        "content": content,
        "student": studentId,
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
//    Future<void> putDailyReport(String date, String content,String studentId,String schoolId,String id) async {
//     try {
//       final response =await _networkManager.dio.put("/dailyreports/$id",
//           data: {
//   "date": date,
//   "content": content,
//   "student": studentId,
//   "school": schoolId
// });
//       if (response.statusCode == 200) {
//         print("Eklendi");

//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}
