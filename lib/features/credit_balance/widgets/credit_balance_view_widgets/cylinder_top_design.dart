import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CylinderTopDesign {
  /// Liquid surface — OPEN oval (no fill), thick stroke.
  /// Active: bright glowing cyan ring.  Inactive: plain gray ring.
  void drawLiquidSurface(
    Canvas canvas,
    double cx,
    double surfaceY,
    double rx,
    double ry,
    double animValue,
    bool isDark,
  ) {
    final Rect rect = Rect.fromCenter(
      center: Offset(cx, surfaceY),
      width: rx * 1.8,
      height: ry * 1.8,
    );

    final Color ringColor = Color.lerp(
      isDark
          ? AppColors.buttonTextColor
          : AppColors.darkPrimaryTextColor, // inactive: mid-gray
      Color(0xFF2DADE2).withValues(alpha: 0.5), // active:   bright cyan
      animValue,
    )!;

    // ── Glow halo (active only) ─────────────────────────────────────────────
    if (animValue > 0.05) {
      // Wide soft outer glow
      canvas.drawOval(
        rect,
        Paint()
          ..color = Color(0xFF2DADE2).withValues(alpha: 0.28 * animValue)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1),
      );
    }

    // ── Crisp main ring (always drawn) ─────────────────────────────────────
    canvas.drawOval(
      rect,
      Paint()
        ..color = ringColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  /// Solid filled oval at the very top — closes the open glass cylinder.
  void drawTopCap(Canvas canvas, double rx, double ry, bool isDark) {
    final Rect rect = Rect.fromCenter(
      center: Offset(rx, ry),
      width: rx * 2,
      height: ry * 2,
    );

    // Filled cap with radial gradient for a slight 3-D convex look
    canvas.drawOval(
      rect,
      Paint()
        ..shader = RadialGradient(
          center: Alignment(0.0, -0.35),
          radius: 0.90,
          colors: isDark
              ? [AppColors.buttonTextColor, AppColors.buttonTextColor]
              : [Color(0xFFD5D5D5), Color(0xFFD5D5D5)],
        ).createShader(rect),
    );

    // Rim stroke
    canvas.drawOval(
      rect,
      Paint()
        ..color = isDark ? AppColors.labelColor : AppColors.darkPrimaryTextColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // Top-arc highlight (left → top → right) for convex glass effect
    canvas.drawArc(
      rect.deflate(2.0),
      math.pi, // left
      math.pi, // sweep to right via top
      false,
      Paint()
        ..color =isDark? AppColors.labelColor:AppColors.darkPrimaryTextColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
  }
}
