import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/data/model/center_list.dart';
import 'package:flutter_public_api_getx/app/data/repository/center_list_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class CentersController extends GetxController
    with SingleGetTickerProviderMixin {
  static CentersController get to => Get.find();
  late ScrollController scrollController;
  Rx<CenterList> _centerData = CenterList(data: []).obs;
  int currentPage = 1;

  @override
  void onInit() {
    scrollController = ScrollController();
    fetchCenterList();
    _event();
    super.onInit();
  }

  CenterList get centerData => _centerData.value;

  fetchCenterList() async {
    CenterList? result = await CenterRepository.to
        .fetchCenterList(page: currentPage, perPage: 15);
    if (result != null && result.data.length > 0) {
      _centerData.update((centers) {
        centers!.currentCount = result.currentCount;
        centers.data.addAll(result.data);
      });
    }
  }

  _event() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          if (_centerData.value.currentCount != 0) {
            currentPage++;
            fetchCenterList();
          }
        }
      },
    );
  }
}
