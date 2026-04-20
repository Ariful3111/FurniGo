import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/sell/models/sell_model.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_action_button.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellTableExpanded extends StatelessWidget {
  final SellModel sellModel;
  const SellTableExpanded({super.key, required this.sellModel});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailRow('Item', sellModel.item ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        buildDetailRow('Submitted', sellModel.submitDate ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        row(text: 'Status:', status: sellModel.status ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        row(
          text: 'Shipment:',
          status: sellModel.shipment ?? '',
          isDark: isDark,
        ),
        SizedBox(height: 8.h),
        row(text: 'PAYMENT:', status: sellModel.payment ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text: 'Next step:',
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
        SizedBox(height: 8.h),
        CustomTableActionButton(
          onTap: () {
            Get.toNamed(AppRoutes.sellDetails, arguments: sellModel);
          },
        ),
      ],
    );
  }

  Widget row({
    required String text,
    required String status,
    required bool isDark,
  }) {
    return Row(
      children: [
        CustomPrimaryText(
          text: text.toUpperCase(),
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
        SizedBox(width: 8.w),
        CustomTableStatus(status: status),
      ],
    );
  }
}
