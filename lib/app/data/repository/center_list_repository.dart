import 'package:dio/dio.dart';
import 'package:flutter_public_api_getx/app/controller/centers/centers_controller.dart';

class CenterRepository {
  late var _dio;

  CentersController() {
    _dio = Dio(
      BaseOptions(baseUrl: "https://api.odcloud.kr/api", headers: {}),
    );
  }
}
