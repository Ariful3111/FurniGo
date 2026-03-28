import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/rental/models/rentals_model.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_action_button.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalExpandedTable extends StatelessWidget {
  final RentalData rental;
  const RentalExpandedTable({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailRow(
          'PROPERTY TYPE',
          rental.propertyType ?? '',
          isDark: isDark,
        ),
        SizedBox(height: 8.h),
        buildDetailRow('START', rental.startDate ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        buildDetailRow('END', rental.endDate ?? '', isDark: isDark),
        SizedBox(height: 8.h),
        Row(
          children: [
            CustomPrimaryText(
              text: 'STATUS:',
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyColor,
            ),
            SizedBox(width: 8.w),
            CustomTableStatus(
              status: (rental.status?.capitalizeFirst ?? 'N/A'),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        buildDetailRow(
          'SHIPMENT',
          rental.shipmentStatus?.capitalizeFirst ?? 'N/A',
          isDark: isDark,
        ),
        SizedBox(height: 8.h),
        buildDetailRow(
          'PAYMENT',
          rental.paymentStatus?.capitalizeFirst ?? 'N/A',
          isDark: isDark,
        ),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text: 'ACTION:',
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
        SizedBox(height: 8.h),
        CustomTableActionButton(
          onTap: () {
            Get.toNamed(AppRoutes.rentalDetailsView);
          },
        ),
      ],
    );
  }
}
