import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class GlassButton extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final VoidCallback onTap;
  final Widget child;
  const GlassButton({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.radius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassmorphicContainer(
        width: width,
        height: height,
        borderRadius: radius,
        blur: 3,
        alignment: Alignment.center,
        border: 0.5,
        linearGradient: LinearGradient(
          colors: [
            AppColors.darkColor.withValues(alpha: 0.2),
            AppColors.darkColor.withValues(alpha: 0.2),
          ],
        ),
        borderGradient: LinearGradient(
          colors: [
            AppColors.whiteColor.withValues(alpha: 0.3),
            AppColors.whiteColor.withValues(alpha: 0.1),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
