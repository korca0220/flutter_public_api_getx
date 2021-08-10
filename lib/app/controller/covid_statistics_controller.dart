import 'package:flutter_public_api_getx/app/canvas/arrow_clip_path.dart';
import 'package:flutter_public_api_getx/app/data/model/covid_statistics.dart';
import 'package:flutter_public_api_getx/app/data/repository/covid_repository.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class CovidStatisticsController extends GetxController {
  late CovidRepository _covidClient;
  Rx<CovidStatisticsModel> _todayData = CovidStatisticsModel().obs;
  RxList<CovidStatisticsModel> _weekDatas = <CovidStatisticsModel>[].obs;
  RxBool isLoading = false.obs;
  double maxDecideValue = 0;

  @override
  void onInit() {
    super.onInit();
    _covidClient = CovidRepository();
    fetchCovidState();
    // fetchCovidStateDummy();
  }

  void fetchCovidState() async {
    isLoading.value = true;
    var startDate = DateFormat('yyyyMMdd')
        .format(DateTime.now().subtract(Duration(days: 7)));
    var endDate = DateFormat('yyyyMMdd').format(DateTime.now());
    var result = await _covidClient.fetchCovidStatistics(
        startDate: startDate, endDate: endDate);
    if (result.isNotEmpty) {
      for (var i = 0; i < result.length; i++) {
        if (i < result.length - 1) {
          result[i].updateCalcAboutYesterday(result[i + 1]);
          if (maxDecideValue < result[i].calcDecideCnt) {
            maxDecideValue = result[i].calcDecideCnt;
          }
        }
      }
      _weekDatas.addAll(result.sublist(0, result.length - 1).reversed);
      _todayData(_weekDatas.last);
      isLoading.value = false;
    }
  }

  void fetchCovidStateDummy() async {
    var startDate = DateFormat('yyyyMMdd')
        .format(DateTime.now().subtract(Duration(days: 8)));
    var endDate = DateFormat('yyyyMMdd').format(DateTime.now());
    var result = await _covidClient.fetchDummy(startDate, endDate);
    if (result.isNotEmpty) {
      for (var i = 0; i < result.length; i++) {
        if (i < result.length - 1) {
          result[i].updateCalcAboutYesterday(result[i + 1]);
          if (maxDecideValue < result[i].calcDecideCnt) {
            maxDecideValue = result[i].calcDecideCnt;
          }
        }
      }
      _weekDatas.addAll(result.sublist(0, result.length - 1).reversed);
      _todayData(_weekDatas.last);
    }
  }

  CovidStatisticsModel get todayData => _todayData.value;
  List<CovidStatisticsModel> get weekDays => _weekDatas;
  ArrowDirection calculateUpDown(double calcDecideCnt) {
    if (calcDecideCnt == 0) {
      return ArrowDirection.MIDDLE;
    } else if (calcDecideCnt > 0) {
      return ArrowDirection.UP;
    } else {
      return ArrowDirection.DOWN;
    }
  }
}
