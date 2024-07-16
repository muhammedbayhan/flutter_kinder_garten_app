
import 'package:kindergartenapp/feature/parent/announcements/model/announcements_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class 
AnnouncementsService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<AnnouncementsModel>?> getSchoolAnnouncements(
      {required String schoolId}) async {
    var response = await _networkManager.dio.get(
      "/announcements?school=$schoolId",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
      if (datas is List) {
        return datas.map((e) => AnnouncementsModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
