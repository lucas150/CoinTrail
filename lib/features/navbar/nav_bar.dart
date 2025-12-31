import 'dart:math' as math;
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>
    with SingleTickerProviderStateMixin {
  static const int _itemCount = 5;

  int _selectedIndex = 2;

  late AnimationController _controller;
  late Animation<double> _animation;

  final List<GlobalKey> _itemKeys = List.generate(
    _itemCount,
    (_) => GlobalKey(),
  );

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

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
    _controller.forward(from: 0);

    if (index == 2) {
      // TODO: Open Add modal
      return;
    }
    setState(() => _selectedIndex = index);
    _controller.forward(from: 0);
  }

  double _getSelectedItemCenterX(BuildContext context) {
    final box =
        _itemKeys[_selectedIndex].currentContext?.findRenderObject()
            as RenderBox?;
    if (box == null) return MediaQuery.of(context).size.width / 2;

    final position = box.localToGlobal(Offset.zero);
    return position.dx + box.size.width / 2;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
          // ─────────────────────────────
          // SMOOTH LINE + CIRCULAR BUMP
          // ─────────────────────────────
          AnimatedBuilder(
            animation: _animation,
            builder: (_, __) {
              return CustomPaint(
                painter: _NavLinePainter(
                  color: colors.primary,
                  centerX: _getSelectedItemCenterX(context),
                  progress: _animation.value,
                ),
                child: const SizedBox(height: 18, width: double.infinity),
              );
            },
          ),

          const SizedBox(height: 6),

          // ─────────────────────────────
          // NAV ICONS
          // ─────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _itemCount,
              (index) => _NavIcon(
                key: _itemKeys[index],
                icon: _icons[index],
                label: _labels[index],
                isSelected: _selectedIndex == index,
                isCenter: index == 2,
                onTap: () => _onTap(index),
              ),
            ),
          ),
        ],
      ),
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
                height: 28,
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
    const segments = 140;

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
