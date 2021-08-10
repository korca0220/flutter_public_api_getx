import 'package:dio/dio.dart';
import 'package:flutter_public_api_getx/app/data/model/covid_statistics.dart';
import 'package:flutter_public_api_getx/app/data/model/dummy_data.dart';
import 'package:xml/xml.dart';

class CovidRepository {
  late var _dio;

  CovidRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.data.go.kr",
        queryParameters: {
          "serviceKey":
              "Yvv6NtTx2QOyMg5bJhHwsGunFsyLBvABAZMtbb/XHOT6iGQekhuhjpmr4bvUtkWgarj+CSQMj21si523SFftpg=="
        },
      ),
    );
  }

  Future<CovidStatisticsModel> fetchCovidStatistics() async {
    var response =
        await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson');
    final document = XmlDocument.parse(response.data);
    final result = document.findAllElements('item');
    if (result.isNotEmpty) {
      return CovidStatisticsModel.fromXml(result.first);
    } else {
      return Future.value(null);
    }
  }

  Future<CovidStatisticsModel> fetchDummy() async {
    final document = XmlDocument.parse(DummyData.dummyXml);
    final result = document.findAllElements('item');
    if (result.isNotEmpty) {
      return CovidStatisticsModel.fromXml(result.first);
    } else {
      return Future.value(null);
    }
  }
}
