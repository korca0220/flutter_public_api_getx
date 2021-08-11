import 'package:flutter/material.dart';
import 'package:flutter_public_api_getx/app/canvas/arrow_clip_path.dart';
import 'package:flutter_public_api_getx/app/utils/data_utils.dart';

class CovidStatisticsViwer extends StatelessWidget {
  const CovidStatisticsViwer({
    Key? key,
    required this.title,
    required this.addedCount,
    required this.upDown,
    required this.totalCount,
    this.dense = false,
    this.titleColor = const Color(0xff4c4e5d),
    this.subValueColor = Colors.black,
    this.spacing = 10,
  }) : super(key: key);

  final String title;
  final double addedCount;
  final ArrowDirection upDown;
  final double totalCount;
  final bool dense;
  final Color titleColor;
  final Color subValueColor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    Color mainColor = Colors.black;
    switch (upDown) {
      case ArrowDirection.UP:
        mainColor = Color(0xffcf5f51);
        break;
      case ArrowDirection.MIDDLE:
        break;
      case ArrowDirection.DOWN:
        mainColor = Color(0xff3749be);
        break;
      default:
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: dense ? 14 : 18,
            ),
          ),
          SizedBox(height: spacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ClipPath(
                  clipper: ArrowClipPath(direction: upDown),
                  child: Container(
                    width: dense ? 10 : 20,
                    height: dense ? 10 : 20,
                    color: mainColor,
                  ),
                ),
              ),
              Text(
                DataUtils.numberFormat(addedCount),
                style: TextStyle(
                  color: mainColor,
                  fontSize: dense ? 25 : 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing * 0.5),
          Text(
            DataUtils.numberFormat(totalCount),
            style: TextStyle(
              color: subValueColor,
              fontSize: dense ? 15 : 20,
            ),
          ),
        ],
      ),
    );
  }
}
