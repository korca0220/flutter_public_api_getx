import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/controller/centers/centers_controller.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_colors.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_text_theme.dart';
import 'package:get/get.dart';

import 'components/center_tile.dart';

class CentersPage extends StatelessWidget {
  CentersPage({Key? key}) : super(key: key);
  final CentersController controller = Get.put(CentersController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: gradientStartColor.withOpacity(0.5),
          ),
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                title: Text(
                  '코로나 백신접종 센터 목록',
                  style: appBarTextStyle,
                ),
                backgroundColor: gradientStartColor,
                centerTitle: true,
                floating: true,
                snap: true,
              ),
              Obx(
                () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return CenterTile(index: index);
                    },
                    childCount: controller.centerData.data.isEmpty
                        ? 0
                        : controller.centerData.data.length,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
