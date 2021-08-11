import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/ui/android/covid/components/covid_trend_chart.dart';
import 'package:flutter_public_api_getx/app/ui/android/covid/components/today_statistics.dart';
import 'package:get/get.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerTopZone =
        Get.mediaQuery.padding.top + AppBar().preferredSize.height;
    return Positioned(
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
                TodayStatistics(),
                SizedBox(height: 30),
                CovidTrendChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
