import 'package:flutter_public_api_getx/app/utils/data_utils.dart';
import 'package:flutter_public_api_getx/app/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class CovidStatisticsModel {
  double? accDefRate;
  double? accExamCnt;
  double? accExamCompCnt;
  double? careCnt;
  double? clearCnt;
  double? deathCnt;
  double? decideCnt;
  double? examCnt;
  double? resutlNegCnt;
  double calcDecideCnt = 0;
  double calcExamCnt = 0;
  double calcClearCnt = 0;
  double calcDeathCnt = 0;
  double? seq;
  String? createDt;
  DateTime? stateDt;
  String? stateTime;
  String? updateDt;

  CovidStatisticsModel({
    this.accDefRate,
    this.accExamCnt,
    this.accExamCompCnt,
    this.careCnt,
    this.clearCnt,
    this.createDt,
    this.deathCnt,
    this.decideCnt,
    this.examCnt,
    this.resutlNegCnt,
    this.seq,
    this.stateDt,
    this.stateTime,
    this.updateDt,
  });

  factory CovidStatisticsModel.empty() {
    return CovidStatisticsModel();
  }

  factory CovidStatisticsModel.fromXml(XmlElement xml) {
    return CovidStatisticsModel(
      accDefRate: XmlUtils.serchResult<double>(xml, 'accDefRate'),
      accExamCnt: XmlUtils.serchResult<double>(xml, 'accExamCnt'),
      accExamCompCnt: XmlUtils.serchResult<double>(xml, 'accExamCompCnt'),
      careCnt: XmlUtils.serchResult<double>(xml, 'careCnt'),
      clearCnt: XmlUtils.serchResult<double>(xml, 'clearCnt'),
      deathCnt: XmlUtils.serchResult<double>(xml, 'deathCnt'),
      decideCnt: XmlUtils.serchResult<double>(xml, 'decideCnt'),
      examCnt: XmlUtils.serchResult<double>(xml, 'examCnt'),
      resutlNegCnt: XmlUtils.serchResult<double>(xml, 'resutlNegCnt'),
      seq: XmlUtils.serchResult<double>(xml, 'seq'),
      createDt: XmlUtils.serchResult<String>(xml, 'createDt'),
      stateDt: XmlUtils.serchResult<String>(xml, 'stateDt') != ''
          ? DateTime.parse(XmlUtils.serchResult<String>(xml, 'stateDt'))
          : null,
      stateTime: XmlUtils.serchResult<String>(xml, 'stateTime'),
      updateDt: XmlUtils.serchResult<String>(xml, 'updateDt'),
    );
  }

  void updateCalcAboutYesterday(CovidStatisticsModel yestdayData) {
    _updateCalcClearCnt(yestdayData.clearCnt!);
    _updateCalcDecideCnt(yestdayData.decideCnt!);
    _updateCalcExamCnt(yestdayData.examCnt!);
    _updateCalcDeathCnt(yestdayData.deathCnt!);
  }

  void _updateCalcDecideCnt(double beforeCnt) {
    calcDecideCnt = decideCnt! - beforeCnt;
  }

  void _updateCalcExamCnt(double beforeCnt) {
    calcExamCnt = examCnt! - beforeCnt;
  }

  void _updateCalcDeathCnt(double beforeCnt) {
    calcDeathCnt = deathCnt! - beforeCnt;
  }

  void _updateCalcClearCnt(double beforeCnt) {
    calcClearCnt = clearCnt! - beforeCnt;
  }

  String get standardDayString => stateDt == null
      ? ''
      : '${DataUtils.simpleDayFormat(stateDt!)} : $stateTime 기준';
}
