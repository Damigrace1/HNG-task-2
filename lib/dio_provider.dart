import 'package:dio/dio.dart';

import 'secrets.dart';

class DioProvider {

  static final DioProvider _instance = DioProvider._internal();
  factory DioProvider() => _instance;
  late Dio dio;

  DioProvider._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: AppSecrets.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future <Response?> get(String path, {Map<String, dynamic>? query}) async {
    try {

      var response = await dio.get(path,
          queryParameters: query);
      return response;
    } catch (e) {

      return null;
    }


  }
}