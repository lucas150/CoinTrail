import 'package:cointrail/core_utils/constants/text_strings.dart';
import 'package:cointrail/features/authentication/screens/splash/curved_bottom_clipper.dart';
import 'package:flutter/material.dart';

class SplashCircle extends StatelessWidget {
  final double positionFromTop;
  final double radius;
  final double bottomContraction;

  const SplashCircle({
    super.key,
    required this.positionFromTop,
    required this.radius,
    this.bottomContraction = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).colorScheme.primary;

    // Flood fill stage
    if (radius > TTexts.floodRadiusThreshold) {
      return bottomContraction < 1.0
          ? ClipPath(
              clipper: CurvedBottomClipper(bottomContraction),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: color,
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              color: color,
            );
    }

    // Expanding circle stage
    return Positioned(
      top: (size.height * positionFromTop) - radius,
      left: (size.width * TTexts.circleCenterFactor) - radius,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
