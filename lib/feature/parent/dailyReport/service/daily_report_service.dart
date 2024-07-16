
import 'package:kindergartenapp/feature/parent/dailyReport/model/daily_report_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class DailyReportService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<DailyReportModel>?> getDailyReportStudent(
      {required String studentId}) async {
    var response = await _networkManager.dio.get(
      "/dailyreports?student=$studentId",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
      if (datas is List) {
        return datas.map((e) => DailyReportModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
