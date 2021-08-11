import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/controller/root_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Root extends GetView<RootController> {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: controller.pages,
      ),
    );
  }
}
