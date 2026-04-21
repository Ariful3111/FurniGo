import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CylinderBottomDesign {
  /// Floor of the inner liquid — full oval at the bottom of the body.
  /// Color: dark gray (inactive) → dark navy (active).
  void drawInnerFloor(
    Canvas canvas,
    double cx,
    double bottomY,
    double rx,
    double ry,
    double animValue,
    bool isDark,
  ) {
    final Rect rect = Rect.fromCenter(
      center: Offset(cx, bottomY),
      width: rx * 2,
      height: ry * 2,
    );

    final Color c = Color.lerp(
     isDark? Color(0xFF292929):AppColors.darkPrimaryTextColor, // inactive: dark gray
       Color(0xFF08107A), // active:   dark navy blue
      animValue,
    )!;

    // Filled oval — slightly lighter centre to give depth illusion
    canvas.drawOval(
      rect,
      Paint()
        ..shader = RadialGradient(
          center: Alignment.topCenter,
          radius: 0.95,
          colors: [Color.lerp(c,isDark? AppColors.darkColor:Colors.white, 0.15)!, c],
        ).createShader(rect),
    );

    // Thin outline
    canvas.drawOval(
      rect,
      Paint()
        ..color = c
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );
  }

  /// Only the FRONT (bottom/lower) half of the outer bottom ellipse.
  /// Creates the open-tube effect at the base.
  void drawOuterBottomArc(Canvas canvas, double rx, double cy, double ry,bool isDark,) {
    canvas.drawArc(
      Rect.fromCenter(center: Offset(rx, cy), width: rx * 2, height: ry * 2),
      0, // 3-o'clock
      math.pi, // sweep to 9-o'clock via 6-o'clock = front/bottom half
      false,
      Paint()
        ..color =isDark? AppColors.darkTitleColor:AppColors.darkPrimaryTextColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }
}