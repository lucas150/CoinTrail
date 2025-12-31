import 'package:flutter/material.dart';

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final LinearGradient card;

  const AppGradients({required this.card});

  @override
  AppGradients copyWith({LinearGradient? card}) {
    return AppGradients(card: card ?? this.card);
  }

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) return this;
    return AppGradients(card: LinearGradient.lerp(card, other.card, t)!);
  }
}

// Light card gradient
const lightCardGradient = AppGradients(
  card: LinearGradient(
    colors: [Color(0xFF2EC4B6), Color.fromARGB(255, 0, 162, 255)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

// Dark card gradient
const darkCardGradient = AppGradients(
  card: LinearGradient(
    colors: [Color(0xFF0466C8), Color(0xFF5C677D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
