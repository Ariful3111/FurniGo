import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_balance.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_section.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_usage_card.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditBalanceView extends StatelessWidget {
  const CreditBalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Credit Balance',
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
            padding: EdgeInsets.all(12.w),
            radius: 12.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: "Credit Balance",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: isDark ? AppColors.whiteColor : AppColors.titleColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: "Available credits ready for your AI design use",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.greyTextColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          CreditBalance(),
          SizedBox(height: 20.h),
          CreditSection(),
          SizedBox(height: 20.h,),
          CreditUsageCard(),
        ],
      ),
    );
  }
}
