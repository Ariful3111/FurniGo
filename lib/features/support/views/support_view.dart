import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/support/widgets/create_ticket.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Support Center',
            onDrawerTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDrawer();
                },
              );
            },
          ),
          SizedBox(height: 12.h),
          SharedContainer(
            padding: EdgeInsets.all(12.r),
            radius: 12.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: "Support Center",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.whiteColor : AppColors.titleColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: "Track tickets or get help with your orders.",
                  fontSize: 12.sp,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.secondaryTextColor,
                ),
                
              ],
            ),
          ),
          SizedBox(height: 16.h),
                CreateTicket(),
        ],
      ),
    );
  }
}
