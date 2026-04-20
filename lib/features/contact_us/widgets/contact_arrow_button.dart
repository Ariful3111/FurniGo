import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ContactArrowButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final Border? border;
  const ContactArrowButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.iconColor,
    this.border,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: SharedContainer(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        border: border,
        radius: 100.r,
        color:
            bgColor ?? (isDark ? AppColors.whiteColor : AppColors.primaryColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryText(
              text: text,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color:
                  textColor ??
                  (isDark ? AppColors.darkColor : AppColors.whiteColor),
            ),
            SizedBox(width: 6.w),
            Image.asset(
              IconsPath.arrowRight,
              height: 12.h,
              width: 12.w,
              color:
                  iconColor ??
                  (isDark ? AppColors.darkColor : AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
