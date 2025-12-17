import 'package:flutter/material.dart';

class SplashController {
  late final AnimationController controller;

  late final Animation<double> circlePosition;
  late final Animation<double> circleRadius;
  late final Animation<double> contentOpacity;
  late final Animation<Color?>
  backgroundColor; // Add background color animation

  SplashController(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 2500),
    );

    // Stage 1 (0-60%): Circle drops from top to 70% with one bounce back to center
    // Stage 2 (60-100%): Circle stays at center (0.5) and expands smoothly
    circlePosition = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 0.7,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30.0, // Drop down
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.7, end: 0.50).chain(
          CurveTween(curve: Curves.easeOut),
        ), // Single smooth bounce back to center
        weight: 10.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.50, end: 0.50), // Stay at center
        weight: 60.0,
      ),
    ]).animate(controller);

    // Stage 1 (0-60%): Small circle
    // Stage 2 (60-100%): Circle expands smoothly from center without bouncing
    circleRadius = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 50.0,
          end: 50.0,
        ), // Stay small during drop/bounce
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 50.0,
          end: 100.0,
        ).chain(CurveTween(curve: Curves.easeOutBack)), // Expand smoothly
        weight: 40.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 100.0,
          end: 800.0, // Flood fill entire screen
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40.0,
      ),
    ]).animate(controller);

    // Text opacity (appears immediately and stays)
    contentOpacity = Tween<double>(begin: 1.0, end: 1.0).animate(controller);

    // Background color animation (changes from white to blue during flood fill)
    backgroundColor =
        ColorTween(
          begin: Colors.white,
          end: const Color(0xFF001BFF), // Blue color to match the circle
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.6,
              1.0,
              curve: Curves.easeInOut,
            ), // During Stage 3 flood fill
          ),
        );
  }

  void start() => controller.forward();
  void dispose() => controller.dispose();
}
