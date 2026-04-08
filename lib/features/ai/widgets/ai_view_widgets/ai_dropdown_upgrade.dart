import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiDropdownUpgrade extends StatelessWidget {
  const AiDropdownUpgrade({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(17.r),
        bottomRight: Radius.circular(17.r),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: SharedContainer(
          width: 300.w,
          height: 47.h,
          radius: 0.r,
          padding: EdgeInsets.zero,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [Color(0xFF141414).withValues(alpha: 0.0), Color(0xFF141414)]
                : [Colors.white.withValues(alpha: 0), Colors.white],
          ),
          child: Center(
            child: CustomPrimaryButton(
              height: 22.h,
              width: 150.w,
              text: 'Upgrade',
              onPressed: () {},
              borderRadius: BorderRadius.circular(13.r),
              padding: EdgeInsets.zero,
              fontSize: 8.sp,
            ),
          ),
        ),
      ),
    );
  }
}
