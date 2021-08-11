import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/components/bar_chart.dart';
import 'package:flutter_public_api_getx/app/controller/covid/covid_statistics_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CovidTrendChart extends GetWidget<CovidStatisticsController> {
  const CovidTrendChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "확진자 추이",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        AspectRatio(
          aspectRatio: 1.7,
          child: Obx(
            () => controller.weekDays.length == 0
                ? Container()
                : CovidBarChart(
                    covidDatas: controller.weekDays,
                    maxY: controller.maxDecideValue,
                  ),
          ),
        )
      ],
    );
  }
}
