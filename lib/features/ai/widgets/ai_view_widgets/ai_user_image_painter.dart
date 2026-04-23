import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class AiUserImagePainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final BuildContext context;

  AiUserImagePainter({
    required this.progress,
    required this.strokeWidth,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Rect rect = Offset.zero & size;
    final Rect arcRect = rect.deflate(strokeWidth / 2);

    // ── 1. Full gray base ring ─────────────────────────────────────────────
    canvas.drawCircle(
      size.center(Offset.zero),
      size.width / 2 - strokeWidth / 2,
      Paint()
        ..color = isDark
            ?  Color(0xFF3A3A3A)
            : AppColors.boxColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // ── 2. Blue gradient arc — top-left quadrant (Figma: ~210° to ~330°) ──
    // In Flutter angles: 0 = 3-o'clock, going clockwise.
    // Top-left arc in Figma starts at roughly 7-o'clock and ends at 11-o'clock
    // i.e. startAngle ≈ 150° (π * 5/6), sweep ≈ 120° (π * 2/3)
    // Converting to radians:
    final double startAngle = math.pi * 5 / 6;  // ~150°  = 7-o'clock area
    final double sweepAngle = math.pi * 2 / 3;  // ~120° sweep

    final SweepGradient gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + sweepAngle,
      colors: const [
        Color(0xFF1348D2), // deep blue
        Color(0xFF1B6ADD), // mid blue
        Color(0xFF209DF0), // cyan-blue
      ],
      stops: const [0.0, 0.5, 1.0],
    );

    canvas.drawArc(
      arcRect,
      startAngle,
      sweepAngle,
      false,
      Paint()
        ..shader = gradient.createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth,
    );
  }

  @override
  bool shouldRepaint(covariant AiUserImagePainter oldDelegate) =>
      oldDelegate.progress != progress;
}