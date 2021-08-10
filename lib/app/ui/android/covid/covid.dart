import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/components/bar_chart.dart';
import 'package:flutter_public_api_getx/app/components/covid_statistics_viwer.dart';
import 'package:flutter_public_api_getx/app/controller/covid/covid_statistics_controller.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_colors.dart';
import 'package:get/get.dart';

class CovidPage extends GetView<CovidStatisticsController> {
  CovidPage({Key? key}) : super(key: key);
  double headerTopZone = 0;

  List<Widget> _background() {
    return [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [gradientStartColor, gradientEndColor],
          ),
        ),
      ),
      Positioned(
        left: -110,
        top: headerTopZone + Get.size.height * 0.05,
        child: Container(
          child: Image.asset("assets/images/covid_img.png",
              width: Get.size.width * 0.7),
        ),
      ),
      Positioned(
        top: headerTopZone + Get.size.height * 0.01,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: gradientColorDeep,
            ),
            child: Obx(
              () => Text(
                controller.todayData.standardDayString,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: headerTopZone * Get.size.height * 0.0022,
        right: Get.size.width * 0.15,
        child: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : CovidStatisticsViwer(
                  title: '확진자',
                  addedCount: controller.todayData.calcDecideCnt.abs(),
                  totalCount: controller.todayData.decideCnt ?? 0,
                  upDown: controller
                      .calculateUpDown(controller.todayData.calcDecideCnt),
                  titleColor: primaryColor,
                  subValueColor: primaryColor,
                ),
        ),
      ),
    ];
  }

  Widget _todayStatistics() {
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

  Widget _covidTrendChart() {
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

  @override
  Widget build(BuildContext context) {
    headerTopZone = Get.mediaQuery.padding.top + AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white),
        title: Text(
          "코로나 일별 현황",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ..._background(),
          Positioned(
            top: headerTopZone + Get.size.height * 0.3,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _todayStatistics(),
                      SizedBox(height: 30),
                      _covidTrendChart()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
