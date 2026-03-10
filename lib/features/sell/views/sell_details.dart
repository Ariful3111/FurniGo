import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell/models/sell_model.dart';
import 'package:zb_dezign/features/sell/widgets/sell_accept_widgets/sell_accept.dart';
import 'package:zb_dezign/features/sell/widgets/sell_details_widgets/sell_details_status.dart';
import 'package:zb_dezign/features/sell/widgets/sell_details_widgets/sell_details_summery.dart';
import 'package:zb_dezign/features/sell/widgets/sell_helper.dart';
import 'package:zb_dezign/features/sell/widgets/sell_offer_ready_widgets/sell_offer_ready.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellDetails extends StatelessWidget {
  const SellDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final SellModel sellModel = Get.arguments as SellModel;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          SellHelper().sellHeader(isDark: isDark, context: context),
          SizedBox(height: 32.h),
          SharedContainer(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomPrimaryText(
                      text: sellModel.id,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.labelColor,
                    ),
                    SizedBox(width: 8.w),
                    CustomTableStatus(status: sellModel.status),
                  ],
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: 'Submitted ${sellModel.submitDate}',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.greyTextColor,
                ),
                SizedBox(height: 20.h),
                CustomDivider(),
                SizedBox(height: 25.h),
                SellDetailsStatus(),
                SizedBox(height: 25.h),
                SellDetailsSummery(),
              ],
            ),
          ),
          if (sellModel.status == 'Offer Ready')
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: SellOfferReady(amount: sellModel.offer),
            ),
          if (sellModel.status == 'Offer Accepted')
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: SellAccept(),
            ),
        ],

      ),
    );
  }
}
