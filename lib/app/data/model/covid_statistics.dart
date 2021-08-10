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
      accDefRate: XmlUtils.serchResultForDouble(xml, 'accDefRate'),
      accExamCnt: XmlUtils.serchResultForDouble(xml, 'accExamCnt'),
      accExamCompCnt: XmlUtils.serchResultForDouble(xml, 'accExamCompCnt'),
      careCnt: XmlUtils.serchResultForDouble(xml, 'careCnt'),
      clearCnt: XmlUtils.serchResultForDouble(xml, 'clearCnt'),
      deathCnt: XmlUtils.serchResultForDouble(xml, 'deathCnt'),
      decideCnt: XmlUtils.serchResultForDouble(xml, 'decideCnt'),
      examCnt: XmlUtils.serchResultForDouble(xml, 'examCnt'),
      resutlNegCnt: XmlUtils.serchResultForDouble(xml, 'resutlNegCnt'),
      seq: XmlUtils.serchResultForDouble(xml, 'seq'),
      createDt: XmlUtils.serchResultForString(xml, 'createDt'),
      stateDt: XmlUtils.serchResultForString(xml, 'stateDt') != ''
          ? DateTime.parse(XmlUtils.serchResultForString(xml, 'stateDt'))
          : null,
      stateTime: XmlUtils.serchResultForString(xml, 'stateTime'),
      updateDt: XmlUtils.serchResultForString(xml, 'updateDt'),
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
