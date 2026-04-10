import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/transaction/models/transaction_model.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class TransactionTableExpanded extends StatelessWidget {
  final TransactionModel transactionModel;
  const TransactionTableExpanded({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomPrimaryText(
              text: 'Status:'.toUpperCase(),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyColor,
            ),
            SizedBox(width: 8.w),
            CustomTableStatus(status: transactionModel.status ?? ''),
          ],
        ),
        SizedBox(height: 8.h),
        buildDetailRow('Type', transactionModel.type ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        buildDetailRow('Method', transactionModel.method ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        buildDetailRow('Date', transactionModel.date ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        buildDetailRow(
          'Amount',
          transactionModel.amount ?? '',
          isDark: isDark,
          valueColor: Color(0xFFAF1D38),
        ),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text: 'Action:'.toUpperCase(),
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            CustomSecondaryButton(
              width: 140.w,
              text: 'View Detail',
              icon: IconsPath.view,
              onPressed: () {
                Get.toNamed(
                  AppRoutes.transactionDetailView,
                  arguments: transactionModel,
                );
              },
            ),
            SizedBox(width: 8.w),
            CustomSecondaryButton(
              width: 140.w,
              text: 'Download',
              icon: IconsPath.download,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
