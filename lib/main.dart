import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/controller/covid/covid_statistics_controller.dart';
import 'package:flutter_public_api_getx/app/controller/root_controller.dart';
import 'package:flutter_public_api_getx/app/routes/app_pages.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_colors.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
      }),
      theme: ThemeData(primaryColor: primaryColor),
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
