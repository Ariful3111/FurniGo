import 'package:flutter/material.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_border.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bottom_design.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_inner_design.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_top_design.dart';

/// [fillRatio]  — 0.0–1.0: how full the cylinder is.
/// [animValue]  — 0.0 = inactive (gray) | 1.0 = active (blue smoky).
///                Drive with TweenAnimationBuilder for smooth transitions.
class CylinderPainter extends CustomPainter {
  final double fillRatio;
  final double animValue;
  final bool isDark;

  const CylinderPainter({required this.fillRatio, required this.animValue, required this.isDark});

  /// Outer ellipse y-radius = width × this fraction.
  static const double _ryFrac = 0.205;

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double rx = w / 2; // outer x-radius
    final double ry = w * _ryFrac; // outer y-radius (ellipse flatness)

    // Straight-wall extent
    final double bodyTop = ry;
    final double bodyBot = h - ry;
    final double bodyH = bodyBot - bodyTop;

    // Fill — bottom-anchored, no vertical gap
    final double fillH = bodyH * fillRatio.clamp(0.0, 1.0);
    final double fillTopY = bodyBot - fillH; // liquid surface y

    // ── Draw order (back → front) ──────────────────────────────────────────

    // 1. Glass side reflections (semi-transparent overlays on the tube walls)
    CylinderBorder().drawGlassSides(canvas, w, bodyTop, bodyBot,isDark);

    // 2. Inner fill — full-width, no gap from outer walls
    if (fillH > 0) {
      CylinderInnerDesign().drawInnerFill(
        canvas,
        w,
        rx,
        ry,
        bodyBot,
        fillTopY,
        fillH,
        animValue,
        isDark
      );
    }

    // 3. Outer side border lines
    CylinderBorder().drawOuterBorders(canvas, w, bodyTop, bodyBot,isDark);

    // 4. Inner floor oval — dark gray (inactive) → dark blue (active)
    if (fillH > 0) {
      CylinderBottomDesign().drawInnerFloor(
        canvas,
        rx,
        bodyBot,
        rx,
        ry,
        animValue,
        isDark
      );
    }

    // 5. Outer bottom — FRONT ARC ONLY (lower half of outer ellipse)
    CylinderBottomDesign().drawOuterBottomArc(canvas, rx, h - ry, ry,isDark);

    // 6. Liquid surface ring — OPEN oval, thick stroke, glow on active
    if (fillH > 0) {
      CylinderTopDesign().drawLiquidSurface(
        canvas,
        rx,
        fillTopY,
        rx,
        ry,
        animValue,
        isDark
      );
    }

    // 7. Top cap — solid filled oval closing the cylinder
    CylinderTopDesign().drawTopCap(canvas, rx, ry,isDark);
  }

  @override
  bool shouldRepaint(CylinderPainter old) =>
      old.fillRatio != fillRatio || old.animValue != animValue;
}
