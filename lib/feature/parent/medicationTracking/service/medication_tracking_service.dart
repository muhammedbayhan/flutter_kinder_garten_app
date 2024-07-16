
import 'package:kindergartenapp/feature/parent/medicationTracking/model/medication_tracking_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class MedicationTrackingService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<MedicationTrackingModel>?> getMedicationStudent(
      {required String studentId}) async {
    var response = await _networkManager.dio.get(
      "/medicinetracks?student=$studentId",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
      if (datas is List) {
        return datas.map((e) => MedicationTrackingModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
