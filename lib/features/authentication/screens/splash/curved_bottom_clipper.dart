import 'package:cointrail/core_utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class CurvedBottomClipper extends CustomClipper<Path> {
  final double contraction;

  const CurvedBottomClipper(this.contraction);

  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height * contraction;

    path
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, height - TTexts.initialCurveOffset);

    final controlPoint1 = Offset(
      size.width * TTexts.curveControlRight,
      height + TTexts.curveDepth,
    );

    final controlPoint2 = Offset(
      size.width * TTexts.curveControlLeft,
      height + TTexts.curveDepth,
    );

    final endPoint = Offset(0, height - TTexts.initialCurveOffset);

    path.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
