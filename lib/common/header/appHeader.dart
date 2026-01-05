import 'package:cointrail/core_utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.bottom,
    this.bottom_widget,
    this.extendedHeight = false,
    this.centerWidget,
    this.showBack = false,
    this.showNotification = false,
    this.onBack,
    this.onNotificationTap,
  });

  final String title;
  final String? subtitle;
  final Widget? bottom_widget;
  final bool extendedHeight;

  /// Optional content BELOW title row
  final Widget? bottom;

  /// Optional widget replacing subtitle/title center area
  final Widget? centerWidget;

  final bool showBack;
  final bool showNotification;

  final VoidCallback? onBack;
  final VoidCallback? onNotificationTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final statusBar = MediaQuery.of(context).padding.top;
    final double baseHeight = 210;

    final double extendedExtra = extendedHeight ? 100 : 0;

    // final double headerHeight = 210 + statusBar;
    final double headerHeight = baseHeight + extendedExtra + statusBar;

    return SizedBox(
      height: headerHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // ───────── BACKGROUND ─────────
          Container(
            height: 170 + statusBar,
            width: double.infinity,
            color: colors.primary,
          ),

          // ───────── WHITE CURVE ─────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80 + (extendedHeight ? 100 : 0),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(48),
                ),
              ),
            ),
          ),

          // ───────── TOP CONTENT ─────────
          Padding(
            padding: EdgeInsets.fromLTRB(
              TSizes.lg,
              TSizes.lg + statusBar,
              TSizes.lg,
              TSizes.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ───── TOP ROW ─────
                Row(
                  children: [
                    if (showBack)
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: onBack ?? () => Navigator.maybePop(context),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: colors.onPrimary,
                          size: 28,
                        ),
                      ),

                    if (showBack) const SizedBox(width: TSizes.sm),

                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: colors.onPrimary,
                        ),
                      ),
                    ),

                    if (showNotification)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colors.onPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: onNotificationTap,
                          child: Icon(
                            Icons.notifications_rounded,
                            color: colors.primary,
                            size: 22,
                          ),
                        ),
                      ),
                  ],
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: TSizes.sm),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 0, 0, 0),
                    child: Text(
                      textAlign: TextAlign.left,

                      subtitle!,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colors.onPrimary.withOpacity(0.9),
                      ),
                    ),
                  ),
                ],

                if (bottom != null) ...[
                  const SizedBox(height: TSizes.sm),
                  bottom!,
                ],

                if (bottom_widget != null) ...[
                  const SizedBox(height: TSizes.buttonPadding),
                  bottom_widget!,
                ],
              ],
            ),
          ),

          // ───────── HERO / CENTER WIDGET ─────────
          if (centerWidget != null)
            Positioned(top: 60 + statusBar, child: centerWidget!),
        ],
      ),
    );
  }
}
