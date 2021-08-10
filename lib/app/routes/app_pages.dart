import 'package:flutter_public_api_getx/app/controller/covid/covid_statistics_controller.dart';
import 'package:flutter_public_api_getx/app/ui/android/covid/covid.dart';
import 'package:flutter_public_api_getx/app/ui/root.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => Root()),
    GetPage(
      name: Routes.COVID,
      page: () => CovidPage(),
      binding: BindingsBuilder(
        () => Get.lazyPut<CovidStatisticsController>(
          () => CovidStatisticsController(),
        ),
      ),
    ),
  ];
}
