import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/ui/android/covid/components/background.dart';
import 'package:flutter_public_api_getx/app/controller/covid/covid_statistics_controller.dart';
import 'package:flutter_public_api_getx/app/ui/android/covid/components/statistics.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_colors.dart';
import 'package:get/get.dart';

class CovidPage extends GetView<CovidStatisticsController> {
  CovidPage({Key? key}) : super(key: key);
  final CovidStatisticsController controller =
      Get.put(CovidStatisticsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: primaryColor),
        title: Text(
          "코로나 일별 현황",
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Background(),
          Statistics(),
        ],
      ),
    );
  }
}
