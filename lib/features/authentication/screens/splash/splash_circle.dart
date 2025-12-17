import 'package:flutter/material.dart';

class SplashCircle extends StatelessWidget {
  final double positionFromTop;
  final double radius;
  final Color color;

  const SplashCircle({
    super.key,
    required this.positionFromTop,
    required this.radius,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // For large radius (flood fill stage), fill entire screen
    if (radius > 400) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: color,
      );
    }

    // For normal radius, use positioned circle
    return Positioned(
      top: (screenHeight * positionFromTop) - radius,
      left: (screenWidth / 2) - radius, // Center horizontally
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
