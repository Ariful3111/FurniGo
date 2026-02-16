import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/model/rental_model.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_action_button.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalExpandedTable extends StatelessWidget {
  final RentalModel rental;

  const RentalExpandedTable({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailRow('PROPERTY TYPE', rental.propertyType),
        SizedBox(height: 8.h),
        buildDetailRow('START', rental.startDate),
        SizedBox(height: 8.h),
        buildDetailRow('END', rental.endDate),
        SizedBox(height: 8.h),
        Row(
          children: [
            CustomPrimaryText(
              text: 'Status : :'.toUpperCase(),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyColor,
            ),
            SizedBox(width: 8.w,),
            CustomTableStatus(status: rental.status),
          ],
        ),
        SizedBox(height: 8.h),
        buildDetailRow('SHIPMENT', rental.shipment),
        SizedBox(height: 8.h),
        buildDetailRow('PAYMENT', rental.payment),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text: 'ACTION:',
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.greyColor,
        ),
        SizedBox(height: 8.h),
        CustomTableActionButton(onTap: () {}),
      ],
    );
  }
}
