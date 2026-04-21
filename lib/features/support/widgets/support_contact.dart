import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SupportContact extends StatelessWidget {
  const SupportContact({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.w),
      color: isDark ? AppColors.darkColor : AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: "Contact us",
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),

          SizedBox(height: 20.h),

          _contactItem(
            context,
            title: "Call Us (Mon-Fri)",
            value: "+1 (555) 123-4567",
            icon: IconsPath.call,
          ),

          SizedBox(height: 16.h),

          _contactItem(
            context,
            title: "Email Support",
            value: "help@furnispace.com",
            icon: IconsPath.email,
          ),
        ],
      ),
    );
  }

  Widget _contactItem(
    BuildContext context, {
    required String title,
    required String value,
    required String icon,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      radius: 16.r,
      color: isDark ? AppColors.labelColor : AppColors.containerColor,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 20.h,
            width: 20.w,
            color: isDark ? AppColors.whiteColor : AppColors.labelColor,
          ),
          SizedBox(width: 22.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: title,
                fontSize: 14.sp,
                color: isDark
                    ? AppColors.whiteColor
                    : AppColors.secondaryTextColor,
              ),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text: value,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.titleColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
