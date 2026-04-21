import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SupportRecentTicketsItems extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const SupportRecentTicketsItems({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      radius: 20.r,
      border: Border.all(color: AppColors.borderColor),
      color: isDark ? AppColors.darkColor : AppColors.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: ticket["title"],
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.titleColor,
              ),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text: ticket["id"],
                fontSize: 12.sp,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.secondaryTextColor,
              ),
              SizedBox(height: 6.h),
              CustomPrimaryText(
                text: ticket["time"],
                fontSize: 14.sp,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.secondaryTextColor,
              ),
            ],
          ),
          CustomTableStatus(status: ticket['status']),
        ],
      ),
    );
  }
}
