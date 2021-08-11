import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_public_api_getx/app/controller/centers/centers_controller.dart';
import 'package:flutter_public_api_getx/app/data/model/center_list.dart';
import 'package:flutter_public_api_getx/app/data/model/dummy_data.dart';

class CenterRepository {
  late var _dio;

  CenterRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.odcloud.kr/api",
        headers: {
          'Authorization': 'Infuser ${dotenv.env['PUBLIC_DATA_API_KEY']}'
        },
      ),
    );
  }

  fetchCenterList({String? page, String? perPage}) async {
    var query = Map<String, String>();
    if (page != null) query.putIfAbsent('page', () => page);
    if (perPage != null) query.putIfAbsent('perPage', () => perPage);

    var response = await _dio.get(
      '/15077586/v1/centers',
      queryParameters: query,
    );
    if (response.status.hashError) {
      return Future.error(response.statusText.toString());
    } else {
      return CenterList.fromJson(response.body);
    }
  }

  fetchDummy({String? page, String? perPage}) async {
    return CenterList.fromJson(jsonDecode(DummyData.dummyCenter));
  }
}
