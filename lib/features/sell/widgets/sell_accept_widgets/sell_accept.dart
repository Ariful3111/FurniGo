import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell/models/sell_model.dart';
import 'package:zb_dezign/features/sell/widgets/sell_accept_widgets/sell_pending_payment.dart';
import 'package:zb_dezign/features/sell/widgets/sell_accept_widgets/sell_recive_payment.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellAccept extends StatelessWidget {
  const SellAccept({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final SellModel sellModel = Get.arguments as SellModel;
    return Column(
      children: [
        SharedContainer(
          child: Column(
            children: [
              status(
                title1: 'Delivery method',
                title2: 'Home Pickup',
                status: sellModel.shipment,
                isDark: isDark,
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text(text: 'Availability1', isDark: isDark),
                  text(text: '12/8/26', isDark: isDark),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text(text: 'Time', isDark: isDark),
                  text(
                    text: 'Between 8 a.m. - 12 p.m.',
                    isDark: isDark,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        SharedContainer(
          child: Column(
            children: [
              status(
                title1: 'Offer Amount',
                title2: sellModel.offer,
                status: sellModel.payment,
                isDark: isDark,
              ),
              SizedBox(height: 12.h),
              sellModel.payment == 'Received'
                  ? SellRecivePayment()
                  : SellPendingPayment(),
            ],
          ),
        ),
      ],
    );
  }

  Widget status({
    required String title1,
    required String title2,
    required String status,
    required bool isDark,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPrimaryText(
              text: title1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
            CustomPrimaryText(
              text: 'Status',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPrimaryText(
              text: title2,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
            CustomTableStatus(status: status),
          ],
        ),
        SizedBox(height: 15.h),
        CustomDivider(),
      ],
    );
  }

  Widget text({
    required String text,
    required bool isDark,
    FontWeight? fontWeight,
  }) {
    return CustomPrimaryText(
      text: text,
      fontSize: 14.sp,
      color: isDark ? AppColors.primaryBorderColor : AppColors.darkTextColor,
      fontWeight: fontWeight,
    );
  }
}
