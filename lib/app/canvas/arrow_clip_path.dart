import 'package:flutter/widgets.dart';

enum ArrowDirection { UP, MIDDLE, DOWN }

class ArrowClipPath extends CustomClipper<Path> {
  ArrowClipPath({
    required this.direction,
  });
  final ArrowDirection direction;

  @override
  getClip(Size size) {
    var path = Path();
    switch (direction) {
      case ArrowDirection.UP:
        path.moveTo(0, size.height);
        path.lineTo(size.width / 2, 0);
        path.lineTo(size.width, size.height);
        break;
      case ArrowDirection.DOWN:
        path.moveTo(0, 0);
        path.lineTo(size.width / 2, size.height);
        path.lineTo(size.width, 0);
        break;
      case ArrowDirection.MIDDLE:
        path.moveTo(0, size.height * 0.4);
        path.lineTo(size.width, size.height * 0.4);
        path.lineTo(size.width, size.height * 0.5);
        path.lineTo(0, size.height * 0.6);
        break;
      default:
    }
    path.close();
    return path;
  }

  // 화면에 다시 그릴지 여부
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
