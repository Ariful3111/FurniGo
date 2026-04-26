import 'dart:math' as math;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';

/// Shows a foreground image on the first onboarding page that the user can
/// spin 360° by dragging the pill bar below it.
class OnboardingRotatableImage extends GetWidget<OnboardingController> {
  final String imagePath;

  /// Changing this key forces animate_do to re-run entrance animations.
  final int pageKey;

  const OnboardingRotatableImage({
    super.key,
    required this.imagePath,
    required this.pageKey,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      key: ValueKey('rotatable_$pageKey'),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Rotating image ─────────────────────────────────────────────
          Obx(() => Transform.rotate(
                angle: controller.rotationAngle.value,
                child: Image.asset(
                  imagePath,
                  height: 220.h,
                  width: 220.h,
                  fit: BoxFit.contain,
                ),
              )),

          SizedBox(height: 20.h),

          // ── Drag bar ────────────────────────────────────────────────────
          FadeIn(
            key: ValueKey('dragbar_$pageKey'),
            delay: const Duration(milliseconds: 400),
            child: GestureDetector(
              onHorizontalDragUpdate: (details) =>
                  controller.updateRotation(details.delta.dx),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                // Expand hit area without widening the visual bar
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: _DragBarWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Pill drag bar ──────────────────────────────────────────────────────────────
class _DragBarWidget extends GetWidget<OnboardingController> {
  const _DragBarWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Clamp the raw angle so we can animate the thumb position on the bar
      final double normalised =
          (math.sin(controller.rotationAngle.value) * 0.5 + 0.5)
              .clamp(0.0, 1.0);

      return Container(
        height: 36.h,
        width: 140.w,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.20),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.35),
            width: 1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Left arrow
            Positioned(
              left: 10.w,
              child: Icon(
                Icons.chevron_left_rounded,
                color: Colors.white.withValues(alpha: 0.70),
                size: 18.sp,
              ),
            ),

            // Sliding thumb dot
            Align(
              alignment: Alignment(
                (normalised * 2 - 1) * 0.55, // -0.55 to +0.55
                0,
              ),
              child: Container(
                height: 22.h,
                width: 22.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryGradient,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 0.45),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ),

            // Right arrow
            Positioned(
              right: 10.w,
              child: Icon(
                Icons.chevron_right_rounded,
                color: Colors.white.withValues(alpha: 0.70),
                size: 18.sp,
              ),
            ),
          ],
        ),
      );
    });
  }
}