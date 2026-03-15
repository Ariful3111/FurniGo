import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/dashboard/models/recent_order_model.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class DashboardTableExpanded extends StatelessWidget {
  final RecentOrderModel orderModel;
  const DashboardTableExpanded({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomPrimaryText(
              text: 'Status : :'.toUpperCase(),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyColor,
            ),
            SizedBox(width: 8.w),
            CustomTableStatus(status: orderModel.status),
          ],
        ),
        SizedBox(height: 8.h),
        buildDetailRow(
          'eta:'.toUpperCase(),
          orderModel.eta.toUpperCase(),
          isDark: isDark,
        ),
        SizedBox(height: 8.h),
        buildDetailRow(
          'total:'.toUpperCase(),
          orderModel.total.toUpperCase(),
          isDark: isDark,
        ),
        SizedBox(height: 8.h),
        buildDetailRow(
          'action:'.toUpperCase(),
          orderModel.action.toUpperCase(),
          isDark: isDark,
        ),
      ],
    );
  }
}
