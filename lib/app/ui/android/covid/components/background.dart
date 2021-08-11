import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/ui/android/covid/components/covid_statistics_viwer.dart';
import 'package:flutter_public_api_getx/app/controller/covid/covid_statistics_controller.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_colors.dart';
import 'package:get/get.dart';

class Background extends GetWidget<CovidStatisticsController> {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerTopZone =
        Get.mediaQuery.padding.top + AppBar().preferredSize.height;
    return Stack(
      children: [
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
      ],
    );
  }
}
