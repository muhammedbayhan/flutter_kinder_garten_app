
import 'package:kindergartenapp/feature/parent/gallery/model/gallery_model.dart';
import 'package:kindergartenapp/product/network/network_manager.dart';

class GalleryService {
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<GalleryModel>?> getGallery(
      {required String schoolId}) async {
    var response = await _networkManager.dio.get(
      "/galery?school=$schoolId",
    );
    if (response.statusCode == 200) {
      final datas = response.data["results"];
      print(datas);
      if (datas is List) {
        return datas.map((e) => GalleryModel.fromJson(e)).toList();
      }
    }

    return null;
  }
}
