
import 'package:kindergartenapp/feature/teacher/splash/model/teacher_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class TeacherService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<TeacherModel>?> getTeacherInfo(
      {required String userId}) async {
    var response = await _networkManager.dio.get(
      "/teachers?user=$userId",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
    
      if (datas is List) {
        return datas.map((e) => TeacherModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
