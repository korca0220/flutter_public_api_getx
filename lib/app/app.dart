import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/canvas/arrow_clip_path.dart';
import 'package:flutter_public_api_getx/app/components/covid_statistics_viwer.dart';
import 'package:flutter_public_api_getx/app/controller/covid_statistics_controller.dart';
import 'package:get/get.dart';

class App extends GetView<CovidStatisticsController> {
  App({Key? key}) : super(key: key);
  double headerTopZone = 0;

  List<Widget> _background() {
    return [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xFF3c727c),
              Color(0xff33656e),
            ],
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
              color: Color(0xff195f68),
            ),
            child: Text(
              '07.24 00:00 기준',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      Positioned(
        top: headerTopZone * Get.size.height * 0.0022,
        right: Get.size.width * 0.15,
        child: CovidStatisticsViwer(
          title: '확진자',
          addedCount: 1629,
          totalCount: 187362,
          upDown: ArrowDirection.UP,
          titleColor: Colors.white,
          subValueColor: Colors.white,
        ),
      ),
    ];
  }

  Widget _todayStatistics() {
    return Row(
      children: [
        Expanded(
          child: CovidStatisticsViwer(
            title: '격리해제',
            addedCount: 1040,
            totalCount: 165246,
            upDown: ArrowDirection.UP,
            dense: true,
          ),
        ),
        Container(
          height: 60,
          child: VerticalDivider(color: Color(0xffc7c7c7)),
        ),
        Expanded(
          child: CovidStatisticsViwer(
            title: '검사 중',
            addedCount: 3314,
            totalCount: 274697,
            upDown: ArrowDirection.DOWN,
            dense: true,
          ),
        ),
        Container(
          height: 60,
          child: VerticalDivider(color: Color(0xffc7c7c7)),
        ),
        Expanded(
          child: CovidStatisticsViwer(
            title: '사망자',
            addedCount: 2,
            totalCount: 2068,
            upDown: ArrowDirection.UP,
            dense: true,
          ),
        ),
      ],
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
          child: Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            // color: const Color(0xff2c4260),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 20,
                barTouchData: BarTouchData(
                  enabled: false,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.transparent,
                    tooltipPadding: const EdgeInsets.all(0),
                    tooltipMargin: 8,
                    getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                    ) {
                      return BarTooltipItem(
                        rod.y.round().toString(),
                        TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                        color: Color(0xff7589a2),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    margin: 20,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Mn';
                        case 1:
                          return 'Te';
                        case 2:
                          return 'Wd';
                        case 3:
                          return 'Tu';
                        case 4:
                          return 'Fr';
                        case 5:
                          return 'St';
                        case 6:
                          return 'Sn';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(showTitles: false),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                          y: 8,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                          y: 10,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                          y: 14,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                          y: 15,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                          y: 13,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                          y: 10,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                ],
              ),
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
            top: headerTopZone + Get.size.height * 0.27,
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
                      SizedBox(height: 20),
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
