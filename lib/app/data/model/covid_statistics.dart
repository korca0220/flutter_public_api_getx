import 'package:flutter_public_api_getx/app/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class CovidStatisticsModel {
  String? accDefRate;
  String? accExamCnt;
  String? accExamCompCnt;
  String? careCnt;
  String? clearCnt;
  String? createDt;
  String? deathCnt;
  String? decideCnt;
  String? examCnt;
  String? resutlNegCnt;
  String? seq;
  String? stateDt;
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

  factory CovidStatisticsModel.fromXml(XmlElement xml) {
    return CovidStatisticsModel(
      accDefRate: XmlUtils.serchResult(xml, 'accDefRate'),
      accExamCnt: XmlUtils.serchResult(xml, 'accExamCnt'),
      accExamCompCnt: XmlUtils.serchResult(xml, 'accExamCompCnt'),
      careCnt: XmlUtils.serchResult(xml, 'careCnt'),
      clearCnt: XmlUtils.serchResult(xml, 'clearCnt'),
      createDt: XmlUtils.serchResult(xml, 'createDt'),
      deathCnt: XmlUtils.serchResult(xml, 'deathCnt'),
      decideCnt: XmlUtils.serchResult(xml, 'decideCnt'),
      examCnt: XmlUtils.serchResult(xml, 'examCnt'),
      resutlNegCnt: XmlUtils.serchResult(xml, 'resutlNegCnt'),
      seq: XmlUtils.serchResult(xml, 'seq'),
      stateDt: XmlUtils.serchResult(xml, 'stateDt'),
      stateTime: XmlUtils.serchResult(xml, 'stateTime'),
      updateDt: XmlUtils.serchResult(xml, 'updateDt'),
    );
  }
}
