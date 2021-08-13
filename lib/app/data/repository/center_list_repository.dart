import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_public_api_getx/app/data/model/center_list.dart';
import 'package:flutter_public_api_getx/app/data/model/dummy_data.dart';
import 'package:get/get.dart';

class CenterRepository extends GetConnect {
  static CenterRepository get to => Get.find();
  Map<String, String> headers = {};

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://api.odcloud.kr/api";
    headers = {
      'Authorization': 'Infuser ${dotenv.env['PUBLIC_DATA_API_KEY']}',
    };
  }

  fetchCenterList({int? page, int? perPage}) async {
    String url = '/15077586/v1/centers?page=$page&perPage=$perPage';
    var response = await get(url, headers: headers);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return CenterList.fromJson(response.body);
    }
  }

  fetchDummy({int? page, int? perPage}) async {
    var result = CenterList.fromJson(jsonDecode(DummyData.dummyCenter));
    return result;
  }
}
