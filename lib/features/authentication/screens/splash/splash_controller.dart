import 'package:cointrail/core_utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SplashController {
  late final AnimationController controller;

  late final Animation<double> circlePosition;
  late final Animation<double> circleRadius;
  late final Animation<double> contentOpacity;
  late final Animation<double> buttonsOpacity;
  late final Animation<double> bottomContraction;

  SplashController(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: TTexts.totalDurationMs),
    );

    // -----------------------------
    // Circle vertical position
    // -----------------------------
    circlePosition = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: TTexts.dropEnd,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: TTexts.dropEnd,
          end: TTexts.center,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 5,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(TTexts.center),
        weight: 50.0,
      ),
    ]).animate(controller);

    // -----------------------------
    // Circle radius
    // -----------------------------
    circleRadius = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween<double>(TTexts.initialRadius),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: TTexts.initialRadius,
          end: TTexts.expandedRadius,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: TTexts.expandedRadius,
          end: TTexts.floodRadius,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(TTexts.floodRadius),
        weight: 45.0,
      ),
    ]).animate(controller);

    // -----------------------------
    // Content opacity (always visible)
    // -----------------------------
    contentOpacity = ConstantTween<double>(1.0).animate(controller);

    // -----------------------------
    // Buttons (final stage only)
    // -----------------------------
    buttonsOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.90, 1.0, curve: Curves.easeIn),
      ),
    );

    // -----------------------------
    // Bottom contraction
    // -----------------------------
    bottomContraction = Tween<double>(begin: 1.0, end: TTexts.minContraction)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              TTexts.contractionStart,
              TTexts.contractionEnd,
              curve: Curves.easeInOut,
            ),
          ),
        );
  }

  void start() => controller.forward();
  void dispose() => controller.dispose();
}
