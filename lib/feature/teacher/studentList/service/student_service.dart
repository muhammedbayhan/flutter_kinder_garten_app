import 'package:kindergartenapp/feature/teacher/studentList/model/student_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class StudentService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<StudentModel>?> getStudents({required String teacherId}) async {
    var response = await _networkManager.dio.get(
      "/teachers/$teacherId/students",
    );
    if (response.statusCode == 200) {
      final datas = response.data;
      print(datas);
      if (datas is List) {
        return datas.map((e) => StudentModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
