import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/controller/covid/covid_statistics_controller.dart';
import 'package:flutter_public_api_getx/app/ui/android/covid/components/covid_statistics_viwer.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_colors.dart';
import 'package:get/get.dart';

class TodayStatistics extends GetWidget<CovidStatisticsController> {
  const TodayStatistics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : CovidStatisticsViwer(
                    title: '격리해제',
                    addedCount: controller.todayData.calcClearCnt.abs(),
                    totalCount: controller.todayData.clearCnt ?? 0,
                    upDown: controller
                        .calculateUpDown(controller.todayData.calcClearCnt),
                    dense: true,
                  ),
          ),
          Container(
            height: 60,
            child: VerticalDivider(color: dividerColor),
          ),
          Expanded(
            child: controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : CovidStatisticsViwer(
                    title: '검사 중',
                    addedCount: controller.todayData.calcExamCnt.abs(),
                    totalCount: controller.todayData.examCnt ?? 0,
                    upDown: controller
                        .calculateUpDown(controller.todayData.calcExamCnt),
                    dense: true,
                  ),
          ),
          Container(
            height: 60,
            child: VerticalDivider(color: dividerColor),
          ),
          Expanded(
            child: controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : CovidStatisticsViwer(
                    title: '사망자',
                    addedCount: controller.todayData.calcDeathCnt.abs(),
                    totalCount: controller.todayData.deathCnt ?? 0,
                    upDown: controller
                        .calculateUpDown(controller.todayData.calcDeathCnt),
                    dense: true,
                  ),
          ),
        ],
      ),
    );
  }
}
