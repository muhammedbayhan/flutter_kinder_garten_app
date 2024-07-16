import 'package:kindergartenapp/product/network/network_manager.dart';

class TeacherCalendarService {
  final NetworkManager _networkManager = NetworkManager.instance;

//Delete

  Future<void> deleteCalendarItem(String id) async {
    try {
      final response = await _networkManager.dio.delete(
        "/calendars/$id",
      );

      if (response.statusCode == 200) {
        print("Silindi");
      }
    } catch (e) {
      print(e);
    }
  }

//post
  Future<void> postCalendarItem(String lessonName, int nameOfDay, int hour,
      int minute, int lessonDuration, String schoolId, String classId) async {
    try {
      final response = await _networkManager.dio.post(
        "/calendars",
        data: {
  "lessonName": lessonName,
  "nameOfDay": nameOfDay,
  "hour": hour,
  "minute": minute,
  "lessonDuration": lessonDuration,
  "school": schoolId,
  "classes": classId
}
      );

      if (response.statusCode == 200) {
        print("Eklendi");
      }
    } catch (e) {
      print(e);
    }
  }
}
