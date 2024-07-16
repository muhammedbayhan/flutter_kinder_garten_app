import 'package:kindergartenapp/product/network/network_manager.dart';

class TeacherAnnouncementsService {
  final NetworkManager _networkManager = NetworkManager.instance;

//Delete

  Future<void> deleteAnnouncement(String id) async {
    try {
      final response = await _networkManager.dio.delete(
        "/announcements/$id",
      );

      if (response.statusCode == 200) {
        print("Silindi");
      }
    } catch (e) {
      print(e);
    }
  }

//post
  Future<void> postAnnouncement(
      String title, String content, String school) async {
    try {
      final response = await _networkManager.dio.post("/announcements",
          data: {"title": title, "content": content, "school": school});

      if (response.statusCode == 200) {
        print("Eklendi");
      }
    } catch (e) {
      print(e);
    }
  }

//put
  Future<void> putAnnouncement(
      String title, String content, String school, String id) async {
    try {
      final response = await _networkManager.dio.put("/announcements/$id",
          data: {"title": title, "content": content, "school": school});

      if (response.statusCode == 200) {
        print("Eklendi");
      }
    } catch (e) {
      print(e);
    }
  }
}
