import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/support/widgets/support_contact.dart';
import 'package:zb_dezign/features/support/widgets/support_create_ticket.dart';
import 'package:zb_dezign/features/support/widgets/support_faq.dart';
import 'package:zb_dezign/features/support/widgets/support_recent_ticket.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
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
          SupportCreateTicket(),
          SizedBox(height: 12.h),
          SupportContact(),
          SizedBox(height: 12.h),
          SupportRecentTicket(),
          SizedBox(height: 12.h),
          SupportFaq(),
          SizedBox(height: 12.h),
          Center(
            child: CustomSecondaryButton(
              text: 'Support',
              textColor: AppColors.whiteColor,
              icon: IconsPath.drawerSupport,
              iconColor: AppColors.whiteColor,
              onPressed: () {},
              backgroundColor: AppColors.primaryColor,
              width: 110.w,
              border: Border.all(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
