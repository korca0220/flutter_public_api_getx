import 'package:flutter_public_api_getx/app/data/model/covid_statistics.dart';
import 'package:flutter_public_api_getx/app/data/repository/covid_repository.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

class CovidStatisticsController extends GetxController {
  late CovidRepository _covidClient;
  Rx<CovidStatisticsModel> covidStatistics = CovidStatisticsModel().obs;

  @override
  void onInit() {
    super.onInit();
    _covidClient = CovidRepository();
    // fetchCovidState();
    fetchCovidStateDummy();
  }

  void fetchCovidState() async {
    var result = await _covidClient.fetchCovidStatistics();
    if (result != null) {
      covidStatistics(result);
    }
  }

  void fetchCovidStateDummy() async {
    var result = await _covidClient.fetchDummy();
    if (result != null) {
      covidStatistics(result);
    }
  }
}
