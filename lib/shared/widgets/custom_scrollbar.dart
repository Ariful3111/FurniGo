import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomScrollbar extends StatelessWidget {
  final ScrollController scrollController;
  final Widget child;
  const CustomScrollbar({
    super.key,
    required this.scrollController,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return RawScrollbar(
      controller: scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      thumbColor: isDark ? AppColors.whiteColor : AppColors.primaryColor,
      trackRadius: Radius.circular(12.r),
      trackColor: isDark ? AppColors.primaryColor : AppColors.buttonBorderColor,
      thickness: 3.83.w,
      radius: Radius.circular(8.r),
      child: child,
    );
  }
}
