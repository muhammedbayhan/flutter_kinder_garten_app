import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late final Dio dio;
  final String? _baseUrl = dotenv.env['BASE_URL'];
  final box = GetStorage();

  NetworkManager._init() {
    dio = Dio(BaseOptions(
      baseUrl: _baseUrl!,
      followRedirects: false,
      validateStatus: (status) {
        if (status == 404) {
          print("404");
          return status == 404;
        }

        if (status == 400) {
          print("400");
          return status == 400;
        }

        if (status == 200) {
          print("200");
          return status == 200;
        }
        return status! < 500;
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = box.read("accesToken");

        if (accessToken != null && accessToken.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $accessToken";
        }

        return handler.next(options);
      },
    ));
  }
}
