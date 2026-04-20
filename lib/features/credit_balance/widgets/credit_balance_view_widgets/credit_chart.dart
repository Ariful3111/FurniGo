import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_chart_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditChart extends StatelessWidget {
  const CreditChart({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final List<CreditChartModel> data = [
      CreditChartModel("Jun", 40),
      CreditChartModel("Jul", 60),
      CreditChartModel("Aug", 24),
      CreditChartModel("Sep", 20),
      CreditChartModel("Oct", 35),
      CreditChartModel("Nov", 40),
      CreditChartModel("Dec", 70),
    ];

    const int maxY = 80;
    const int selectedIndex = 6;

    return SharedContainer(
      height: 180.h,
      padding: EdgeInsets.all(12.r),
      border: Border.all(
        width: 1.r,
        color: isDark
            ? AppColors.darkBorderColor
            : AppColors.primaryBorderColor,
      ),
      radius: 16.r,
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 4),
          blurRadius: 18.3,
          color: AppColors.darkColor.withValues(alpha: 0.05),
        ),
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: data.asMap().entries.map((entry) {
          final int index = entry.key;
          final CreditChartModel item = entry.value;
          final bool isSelected = index == selectedIndex;
          final double fillRatio = (item.value ?? 0) / maxY;

          return _CylinderBar(
            label: item.month ?? '',
            value: item.value ?? 0,
            fillRatio: fillRatio,
            isSelected: isSelected,
            isDark: isDark,
          );
        }).toList(),
      ),
    );
  }
}

class _CylinderBar extends StatelessWidget {
  final String label;
  final int value;
  final double fillRatio;
  final bool isSelected;
  final bool isDark;

  const _CylinderBar({
    required this.label,
    required this.value,
    required this.fillRatio,
    required this.isSelected,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPrimaryText(
          text: '$value',
          fontSize: 8,
          color: AppColors.labelColor,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: 28.w,
          height: 100.h,
          child: CustomPaint(
            painter: _CylinderPainter(
              fillRatio: fillRatio,
              isSelected: isSelected,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        CustomPrimaryText(
          text: label,
          fontSize: 8,
          color: isSelected
              ? AppColors.secondaryColor
              : AppColors.greyTextColor,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _CylinderPainter extends CustomPainter {
  final double fillRatio;
  final bool isSelected;

  _CylinderPainter({required this.fillRatio, required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double ry = w * 0.22;

    final double bodyTop = ry;
    final double bodyBottom = h - ry;
    final double bodyHeight = bodyBottom - bodyTop;

    if (isSelected) {
      _drawActiveCylinder(
        canvas,
        size,
        w,
        h,
        ry,
        bodyTop,
        bodyBottom,
        bodyHeight,
      );
    } else {
      _drawInactiveCylinder(
        canvas,
        size,
        w,
        h,
        ry,
        bodyTop,
        bodyBottom,
        bodyHeight,
      );
    }
  }

  void _drawActiveCylinder(
    Canvas canvas,
    Size size,
    double w,
    double h,
    double ry,
    double bodyTop,
    double bodyBottom,
    double bodyHeight,
  ) {
    // --- Clip to cylinder body ---
    final Path bodyClip = Path()
      ..addRect(Rect.fromLTWH(0, bodyTop, w, bodyHeight + ry));
    canvas.save();
    canvas.clipPath(bodyClip);

    // 1. Base dark blue background fill
    final Paint basePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          const Color(0xFF1A2FC0),
          const Color(0xFF1E4DD8),
          const Color(0xFF1A2FC0),
        ],
      ).createShader(Rect.fromLTWH(0, bodyTop, w, bodyHeight));
    canvas.drawRect(Rect.fromLTWH(0, bodyTop, w, bodyHeight), basePaint);

    // 2. Smoky teal layer — large soft radial from bottom-left
    final Paint smoke1 = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, 0.5),
        radius: 1.0,
        colors: [
          const Color(0xFF00C9B1).withValues(alpha: 0.55),
          const Color(0xFF00C9B1).withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, bodyTop, w, bodyHeight));
    canvas.drawRect(Rect.fromLTWH(0, bodyTop, w, bodyHeight), smoke1);

    // 3. Smoky teal layer — mid area
    final Paint smoke2 = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.4, 0.0),
        radius: 0.85,
        colors: [
          const Color(0xFF2DD4F0).withValues(alpha: 0.40),
          const Color(0xFF2DD4F0).withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, bodyTop, w, bodyHeight));
    canvas.drawRect(Rect.fromLTWH(0, bodyTop, w, bodyHeight), smoke2);

    // 4. Smoky blue layer — top-right
    final Paint smoke3 = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.6, -0.5),
        radius: 0.9,
        colors: [
          const Color(0xFF4A90E2).withValues(alpha: 0.35),
          const Color(0xFF4A90E2).withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, bodyTop, w, bodyHeight));
    canvas.drawRect(Rect.fromLTWH(0, bodyTop, w, bodyHeight), smoke3);

    // 5. Soft vertical light streak on left edge (glass reflection)
    final Paint streak = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white.withValues(alpha: 0.12),
          Colors.white.withValues(alpha: 0.04),
          Colors.white.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, bodyTop, w * 0.25, bodyHeight));
    canvas.drawRect(Rect.fromLTWH(0, bodyTop, w * 0.25, bodyHeight), streak);

    canvas.restore();

    // 6. Bottom ellipse (dark base)
    final Paint bottomFill = Paint()
      ..color = const Color(0xFF101D8A)
      ..style = PaintingStyle.fill;
    canvas.drawOval(Rect.fromLTWH(0, h - ry * 2, w, ry * 2), bottomFill);
    canvas.drawOval(
      Rect.fromLTWH(0, h - ry * 2, w, ry * 2),
      Paint()
        ..color = const Color(0xFF2040C0)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );

    // 7. Top ellipse fill
    final Paint topFill = Paint()
      ..color = const Color(0xFF1A2FC0)
      ..style = PaintingStyle.fill;
    canvas.drawOval(Rect.fromLTWH(0, 0, w, ry * 2), topFill);

    // 8. Top rim cyan ring
    canvas.drawOval(
      Rect.fromLTWH(0, 0, w, ry * 2),
      Paint()
        ..color = const Color(0xFF2DD4F0)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.8,
    );

    // 9. Outer side borders
    final Paint sideBorder = Paint()
      ..color = const Color(0xFF2A40C8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawLine(Offset(0, bodyTop), Offset(0, bodyBottom), sideBorder);
    canvas.drawLine(Offset(w, bodyTop), Offset(w, bodyBottom), sideBorder);
  }

  void _drawInactiveCylinder(
    Canvas canvas,
    Size size,
    double w,
    double h,
    double ry,
    double bodyTop,
    double bodyBottom,
    double bodyHeight,
  ) {
    // Clip
    final Path bodyClip = Path()
      ..addRect(Rect.fromLTWH(0, bodyTop, w, bodyHeight + ry));
    canvas.save();
    canvas.clipPath(bodyClip);

    // Body fill — subtle horizontal gradient for cylindrical look
    final Paint bodyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          const Color(0xFFD0D0D0),
          const Color(0xFFEFEFEF),
          const Color(0xFFD0D0D0),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, bodyTop, w, bodyHeight));
    canvas.drawRect(Rect.fromLTWH(0, bodyTop, w, bodyHeight), bodyPaint);

    canvas.restore();

    // Bottom ellipse
    canvas.drawOval(
      Rect.fromLTWH(0, h - ry * 2, w, ry * 2),
      Paint()
        ..color = const Color(0xFFC8C8C8)
        ..style = PaintingStyle.fill,
    );
    canvas.drawOval(
      Rect.fromLTWH(0, h - ry * 2, w, ry * 2),
      Paint()
        ..color = const Color(0xFFBBBBBB)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );

    // Top ellipse
    canvas.drawOval(
      Rect.fromLTWH(0, 0, w, ry * 2),
      Paint()
        ..color = const Color(0xFFE8E8E8)
        ..style = PaintingStyle.fill,
    );
    canvas.drawOval(
      Rect.fromLTWH(0, 0, w, ry * 2),
      Paint()
        ..color = const Color(0xFFBBBBBB)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // Side borders
    final Paint sideBorder = Paint()
      ..color = const Color(0xFFBBBBBB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawLine(Offset(0, bodyTop), Offset(0, bodyBottom), sideBorder);
    canvas.drawLine(Offset(w, bodyTop), Offset(w, bodyBottom), sideBorder);
  }

  @override
  bool shouldRepaint(_CylinderPainter old) =>
      old.fillRatio != fillRatio || old.isSelected != isSelected;
}
