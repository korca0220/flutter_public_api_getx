import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/controller/centers/centers_controller.dart';
import 'package:flutter_public_api_getx/app/ui/theme/app_colors.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CenterTile extends GetWidget<CentersController> {
  const CenterTile({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(
          Icons.circle_notifications,
          size: 40,
        ),
        title: Text(
          controller.centerData.data[index].centerName,
          style: TextStyle(
            color: gradientColorDeep,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          controller.centerData.data[index].address,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
