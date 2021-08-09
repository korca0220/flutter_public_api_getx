import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/controller/covid_statistics_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class App extends GetView<CovidStatisticsController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("코로나 일별 현황"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          var info = controller.covidStatistics.value;
          return Column(
            children: [
              InfoWidget(title: "기준일", value: info.stateDt),
              InfoWidget(title: "기준시간", value: info.stateTime),
              InfoWidget(title: "확진자 수", value: info.decideCnt),
              InfoWidget(title: "격리해제 수", value: info.clearCnt),
              InfoWidget(title: "검사진행 수", value: info.examCnt),
              InfoWidget(title: "사망자 수", value: info.deathCnt),
              InfoWidget(title: "치료중 환자 수", value: info.careCnt),
              InfoWidget(title: "결과 음성 수", value: info.resutlNegCnt),
              InfoWidget(title: "누적 검사 수", value: info.accExamCnt),
              InfoWidget(title: "누적 검사 완료 수", value: info.accExamCompCnt),
              InfoWidget(title: "누적 확진률", value: info.accDefRate),
            ],
          );
        }),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.title,
    this.value,
  }) : super(key: key);

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(
            " : $value",
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
