import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_timeline/custom_payment_timeline.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardPaymentSchedule extends StatelessWidget {
  const DashboardPaymentSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"date": "Oct 15", "amount": "\$125.00", "active": true, 'paid': 'Paid'},
      {"date": "Nov 15", "amount": "\$125.00", "active": false, 'paid': 'Paid'},
      {"date": "Dec 15", "amount": "\$125.00", "active": false, 'paid': 'Paid'},
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      radius: 20.sp,
      color: isDark ? AppColors.buttonTextColor : Color(0xFFF4F4F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Payment Schedule',
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 14.h),
          CustomPaymentTimeline(items: items),
          SizedBox(height: 14.h),
          CustomPrimaryButton(
            text: 'Pay Early',
            onPressed: () {
              showDialog(
                barrierColor: isDark
                    ? AppColors.whiteColor.withValues(alpha: 0.3)
                    : null,
                context: context,
                builder: (context) {
                  return CustomPaymentDialog(icon: IconsPath.success);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
