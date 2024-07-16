

import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart' as dio;

import 'package:kindergartenapp/product/network/network_manager.dart';

class TeacherGalleryService {
  final NetworkManager _networkManager = NetworkManager.instance;

//Delete
  
  Future<void> deleteImage(String id) async {
    try {
      final response = await _networkManager.dio.delete("/galery/$id",);

      if (response.statusCode == 200) {
        print("Silindi");
      }
    } catch (e) {
      print(e);
    }
  }



//post
Future<void> postImage(String schoolId, File imageFile) async {
  try {
    var formData = dio.FormData();
    formData.fields.add(MapEntry("school", schoolId));
    formData.files.add(
      MapEntry(
        "file",
        await dio.MultipartFile.fromFile(
          imageFile.path,
          filename: "image.jpg", // Optional: specify the file name
        ),
      ),
    );

    final response = await _networkManager.dio.post(
      "/galery",
      data: formData,
    );

    if (response.statusCode == 200) {
      print("Eklendi");
    }
  } catch (e) {
    print(e);
  }
}




}
