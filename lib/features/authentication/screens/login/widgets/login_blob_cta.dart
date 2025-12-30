import 'package:cointrail/common/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class LoginBlobCTA extends StatelessWidget {
  final double height;
  final String primaryButtonText;
  final String secondaryText;
  final VoidCallback? onPrimaryTap;
  final VoidCallback? onSecondaryTap;

  const LoginBlobCTA({
    super.key,
    required this.height,
    required this.primaryButtonText,
    required this.secondaryText,
    this.onPrimaryTap,
    this.onSecondaryTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: (size.width / 2) - (size.width * 0.65),
            child: Container(
              width: size.width * 1.3,
              height: size.width * 1.2,
              decoration: BoxDecoration(
                color: colors.secondary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: size.height * 0.11,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TPrimaryButton(
                    text: primaryButtonText,
                    onPressed: onPrimaryTap ?? () {},
                  ),
                  TextButton(
                    onPressed: onSecondaryTap,
                    child: Text(
                      secondaryText,
                      style: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
