import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeHelper {
  BoxShadow boxShadow() {
    return BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 4,
      color: AppColors.darkColor.withValues(alpha: 0.25),
    );
  }

  Widget blurContainer({
    required double height,
    required double width,
    required Widget child,
    double? radius,
  }) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Color(0xFF4F4F4F).withValues(alpha: 0.1),
            borderRadius: BorderRadiusGeometry.circular(radius ?? 8.r),
            border: Border.all(
              width: 1.r,
              color: AppColors.whiteColor.withValues(alpha: 0.5),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget categoryTitle({
    required String title,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: title,
          color: isDark ? AppColors.whiteColor : AppColors.titleColor,
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomPrimaryText(text: 'See All', fontSize: 14.sp,decoration: TextDecoration.underline,),
        ),
      ],
    );
  }
  
}
enum SplitSide { left, right }

class SplitImageClipper extends CustomClipper<Rect> {
  final double position;
  final SplitSide side;

  const SplitImageClipper({required this.position, required this.side});

  @override
  Rect getClip(Size size) {
    final dx = (size.width * position).clamp(0.0, size.width);
    if (side == SplitSide.left) {
      return Rect.fromLTWH(0, 0, dx, size.height);
    }
    return Rect.fromLTWH(dx, 0, size.width - dx, size.height);
  }

  @override
  bool shouldReclip(covariant SplitImageClipper oldClipper) {
    return oldClipper.position != position || oldClipper.side != side;
  }
}
