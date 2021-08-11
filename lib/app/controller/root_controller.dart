import 'package:flutter/widgets.dart';
import 'package:flutter_public_api_getx/app/ui/android/covid/covid.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RootController extends GetxController {
  late PageController pageController;

  final List<Widget> pages = [
    CovidPage(),
    Container(),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }
}
