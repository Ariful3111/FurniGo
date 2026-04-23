import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CylinderInnerDesign {
  void drawInnerFill(
    Canvas canvas,
    double w,
    double rx,
    double ry,
    double bodyBot,
    double fillTopY,
    double fillH,
    double animValue,
    bool isDark,
  ) {
    final Rect fillRect = Rect.fromLTWH(0, fillTopY, w, fillH);
    // Clip path: rectangle sides + curved bottom matching the outer ellipse
    final Path clip = Path()
      ..moveTo(0, fillTopY)
      ..lineTo(0, bodyBot)
      ..arcTo(
        Rect.fromCenter(center: Offset(rx, bodyBot), width: w, height: ry * 2),
        math.pi, // start at left (9-o'clock)
        math.pi, // sweep: left → bottom → right
        false,
      )
      ..lineTo(w, fillTopY)
      ..close();

    canvas.save();
    canvas.clipPath(clip);

    // ── Inactive gray (fades out as animValue → 1) ──────────────────────────
    final double grayA = 1.0 - animValue;
    if (grayA > 0.01) {
      canvas.drawRect(
        fillRect,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
             isDark? Color(0xFF292929):AppColors.darkPrimaryTextColor.withValues(alpha: grayA),
             isDark? Color(0xFF0D0D0D) :Color(0xFFDBDBDB).withValues(alpha: grayA),
            ],
            stops: const [0.0, 1.0],
          ).createShader(fillRect),
      );
    }

    // ── Active blue smoky (fades in as animValue → 1) ─────────────────────
    if (animValue > 0.01) {
      // Base: deep blue
      canvas.drawRect(
        fillRect,
        Paint()..color = const Color(0xFF1820AA).withValues(alpha: animValue),
      );

      // Smoke 1 — teal, bottom-left
      canvas.drawRect(
        fillRect,
        Paint()
          ..shader = RadialGradient(
            center: const Alignment(-0.25, 0.6),
            radius: 1.0,
            colors: [const Color(0xFF00C9B1), Colors.transparent],
          ).createShader(fillRect),
      );

      // Smoke 2 — cyan, centre
      canvas.drawRect(
        fillRect,
        Paint()
          ..shader = RadialGradient(
            center: const Alignment(0.35, 0.05),
            radius: 0.80,
            colors: [
              const Color(0xFF2DD4F0).withValues(alpha: 0.50 * animValue),
              Colors.transparent,
            ],
          ).createShader(fillRect),
      );

      // Smoke 3 — electric blue, upper-right
      canvas.drawRect(
        fillRect,
        Paint()
          ..shader = RadialGradient(
            center: const Alignment(0.55, -0.45),
            radius: 0.90,
            colors: [
              const Color(0xFF5B9DFF).withValues(alpha: 0.40 * animValue),
              Colors.transparent,
            ],
          ).createShader(fillRect),
      );

      // Smoke 4 — extra teal, bottom-right (for richness)
      canvas.drawRect(
        fillRect,
        Paint()
          ..shader = RadialGradient(
            center: const Alignment(0.5, 0.8),
            radius: 0.70,
            colors: [
              const Color(0xFF00E5CC).withValues(alpha: 0.30 * animValue),
              Colors.transparent,
            ],
          ).createShader(fillRect),
      );

      // Glass-wall shimmer on the left edge
      final Rect shim = Rect.fromLTWH(0, fillTopY, w * 0.20, fillH);
      canvas.drawRect(
        shim,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white.withValues(alpha: 0.14 * animValue),
              Colors.transparent,
            ],
          ).createShader(shim),
      );
    }

    canvas.restore();
  }

}