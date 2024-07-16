
import 'package:kindergartenapp/feature/parent/calendar/model/calendar_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class CalendarService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<CalendarModel>?> getCalendar(
      {required String classId}) async {
    var response = await _networkManager.dio.get(
      "/calendars?classes=$classId&limit=100",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
      if (datas is List) {
        return datas.map((e) => CalendarModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
