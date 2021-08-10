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
                    children: [
                      _todayStatistics(),
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
