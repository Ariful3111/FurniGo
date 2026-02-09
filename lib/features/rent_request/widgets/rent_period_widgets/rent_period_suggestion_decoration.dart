import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class RentPeriodSuggestionDecoration extends StatelessWidget {
  final Widget child;
  final bool isFocus;
  const RentPeriodSuggestionDecoration({
    super.key,
    required this.child,
    required this.isFocus,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(isFocus ? 16.r : 0),
        width: 332.w,
        decoration: isFocus
            ? BoxDecoration(
                color: isDark ? AppColors.whiteColor : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 28,
                    color: AppColors.shadowColor.withValues(alpha: 0.10),
                  ),
                ],
              )
            : null,
        child: child,
      ),
    );
  }
}
