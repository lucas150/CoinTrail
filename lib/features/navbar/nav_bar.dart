import 'dart:math' as math;
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  static const int _itemCount = 5;

  late AnimationController _controller;
  late Animation<double> _animation;

  final _icons = const [
    Icons.home,
    Icons.bar_chart,
    Icons.add,
    Icons.search,
    Icons.settings,
  ];

  final _labels = const ['Home', 'Analysis', 'Add', 'Search', 'Settings'];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant NavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _centerX(Size size) {
    final sectionWidth = size.width / _itemCount;
    return sectionWidth * widget.currentIndex + sectionWidth / 2;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.only(top: 12, bottom: 16),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ─────────────────────────
              // LINE + CIRCULAR BUMP
              // ─────────────────────────
              AnimatedBuilder(
                animation: _animation,
                builder: (_, __) {
                  return CustomPaint(
                    painter: _NavLinePainter(
                      color: colors.primary,
                      centerX: _centerX(constraints.biggest),
                      progress: _animation.value,
                    ),
                    child: const SizedBox(height: 18, width: double.infinity),
                  );
                },
              ),

              const SizedBox(height: 6),

              // ─────────────────────────
              // ICONS
              // ─────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  _itemCount,
                  (index) => _NavIcon(
                    icon: _icons[index],
                    label: _labels[index],
                    isSelected: widget.currentIndex == index,
                    isCenter: index == 2,
                    onTap: () => widget.onChanged(index),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isCenter;
  final VoidCallback onTap;

  const _NavIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.isCenter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(
          0,
          isSelected ? (isCenter ? -14 : -10) : 0,
          0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCenter)
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white),
              )
            else
              Icon(
                icon,
                color: isSelected
                    ? colors.primary
                    : colors.onSurface.withOpacity(0.5),
              ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? colors.primary
                    : colors.onSurface.withOpacity(0.6),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLinePainter extends CustomPainter {
  final Color color;
  final double centerX;
  final double progress;

  _NavLinePainter({
    required this.color,
    required this.centerX,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.7)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final baselineY = size.height - 8;
    final eased = Curves.easeOutExpo.transform(progress);

    final verticalRadius = 14 * eased;
    final horizontalRadius = 28 * eased;

    final path = Path();
    const segments = 160;

    for (int i = 0; i <= segments; i++) {
      final x = size.width * (i / segments);
      double y = baselineY;

      final dx = x - centerX;

      if (dx.abs() <= horizontalRadius) {
        final nx = dx / horizontalRadius;
        final dy = math.sqrt(1 - nx * nx) * verticalRadius;
        y -= dy;
      }

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
