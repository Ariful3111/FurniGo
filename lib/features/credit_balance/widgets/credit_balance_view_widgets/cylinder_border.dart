import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CylinderBorder {
  
  /// Semi-transparent white strips simulate the glass tube walls.
  void drawGlassSides(Canvas canvas, double w, double top, double bot,bool isDark) {
    final double bh = bot - top;

    // Left: bright narrow reflection
    final Rect lr = Rect.fromLTWH(0, top, w * 0.5, bh);
    canvas.drawRect(lr, Paint()..color =isDark? Color(0xFF0D0D0D): AppColors.primaryBorderColor);

    // Right: softer reflection
    final Rect rr = Rect.fromLTWH(w * 1, top, w * -0.5, bh);
    canvas.drawRect(rr, Paint()..color =isDark? Color(0xFF0D0D0D):AppColors.primaryBorderColor);
  }

  /// Fill body — full cylinder width, curved at the bottom with the outer ry.

  /// Thin border lines along the straight outer walls.
  void drawOuterBorders(Canvas canvas, double w, double top, double bot,bool isDark) {
    final Paint p = Paint()
      ..color =isDark? AppColors.labelColor: AppColors.darkPrimaryTextColor
      ..strokeWidth = 0.65
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, top), Offset(0, bot), p);
    canvas.drawLine(Offset(w, top), Offset(w, bot), p);
  }

}