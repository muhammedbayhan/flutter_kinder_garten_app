import 'package:kindergartenapp/feature/parent/parentChildren/model/parent_children_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class ParentChildrenService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<ParentChildrenModel>?> getParentChildren(
      {required String roleId}) async {
    var response = await _networkManager.dio.get(
      "/students?parent=$roleId",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
      if (datas is List) {
        return datas.map((e) => ParentChildrenModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
