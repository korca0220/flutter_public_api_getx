import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_public_api_getx/app/data/model/covid_statistics.dart';
import 'package:flutter_public_api_getx/app/data/model/dummy_data.dart';
import 'package:xml/xml.dart';

class CovidRepository {
  late var _dio;

  CovidRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.data.go.kr",
        queryParameters: {"serviceKey": dotenv.env['PUBLIC_DATA_API_KEY']},
      ),
    );
  }

  Future<List<CovidStatisticsModel>> fetchCovidStatistics(
      {String? startDate, String? endDate}) async {
    var query = Map<String, String>();
    if (startDate != null) query.putIfAbsent('startCreateDt', () => startDate);
    if (endDate != null) query.putIfAbsent('endCreateDt', () => endDate);
    var response = await _dio.get(
        '/openapi/service/rest/Covid19/getCovid19InfStateJson',
        queryParameters: query);
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return results
          .map<CovidStatisticsModel>(
              (element) => CovidStatisticsModel.fromXml(element))
          .toList();
    } else {
      return Future.value(null);
    }
  }

  Future<List<CovidStatisticsModel>> fetchDummy(
      String? startDate, String? endDate) async {
    final document = XmlDocument.parse(DummyData.dummyXml);
    final result = document.findAllElements('item');
    if (result.isNotEmpty) {
      return result
          .map<CovidStatisticsModel>((e) => CovidStatisticsModel.fromXml(e))
          .toList();
    } else {
      return Future.value(null);
    }
  }
}
