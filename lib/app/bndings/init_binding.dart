import 'package:flutter_public_api_getx/app/controller/root_controller.dart';
import 'package:flutter_public_api_getx/app/data/repository/center_list_repository.dart';
import 'package:get/instance_manager.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CenterRepository>(CenterRepository(), permanent: true);
    Get.put<RootController>(RootController());
  }
}
