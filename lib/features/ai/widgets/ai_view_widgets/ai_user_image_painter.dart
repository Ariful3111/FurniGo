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
    final rect = Offset.zero & size;
    final basePaint = Paint()
      ..color = isDark ? AppColors.primaryColor : AppColors.boxColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, basePaint);
    final gradient = SweepGradient(
      startAngle: -0.8,
      endAngle: 1.2,
      stops: [0.0, 0.5, 1.0],
      colors: [Color(0xFF1348D2), Color(0xFF1B6ADD), Color(0xFF209DF0)],
    );

    final arcPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect.deflate(strokeWidth / 2), -1.4, 1.6, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant AiUserImagePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
