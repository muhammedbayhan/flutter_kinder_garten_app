import 'package:kindergartenapp/product/network/network_manager.dart';

class TeacherMedicationTrackingService {
  final NetworkManager _networkManager = NetworkManager.instance;

//Delete

  Future<void> deleteMedicineTrack(String id) async {
    try {
      final response = await _networkManager.dio.delete(
        "/medicinetracks/$id",
      );

      if (response.statusCode == 200) {
        print("Silindi");
      }
    } catch (e) {
      print(e);
    }
  }

//post
  Future<void> postMedicineTrack(String date, String medicine, String detail,
      String studentId, String schoolId) async {
    try {
      final response = await _networkManager.dio.post("/medicinetracks", data: {
        "date": date,
        "medicine": medicine,
        "detail": detail,
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
//    Future<void> putMedicineTrack(
//       String date, String medicine,String detail, String studentId, String schoolId) async {
//     try {
//       final response = await _networkManager.dio.put("/medicinetracks", data: {
//   "date": date,
//   "medicine": medicine,
//   "detail": detail,
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
