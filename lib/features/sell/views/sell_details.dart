import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell/controller/sell_details_controller.dart';
import 'package:zb_dezign/features/sell/models/sell_model.dart';
import 'package:zb_dezign/features/sell/widgets/sell_accept_widgets/sell_accept.dart';
import 'package:zb_dezign/features/sell/widgets/sell_details_widgets/sell_details_status.dart';
import 'package:zb_dezign/features/sell/widgets/sell_details_widgets/sell_details_summery.dart';
import 'package:zb_dezign/features/sell/widgets/sell_helper.dart';
import 'package:zb_dezign/features/sell/widgets/sell_offer_ready_widgets/sell_offer_ready.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_dialog.dart';
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
    SellDetailsController sellDetailsController = Get.find();
    return CustomContainer(
      child: ListView(
        children: [
          SellHelper().sellHeader(
            isDark: isDark,
            context: context,
            onTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
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
              child: SellOfferReady(
                amount: sellModel.offer,
                onPayment: () {
                  Navigator.pop(context);
                  showDialog(
                    barrierColor:
                        isDark ? AppColors.whiteColor.withValues(alpha: 0.3) : null,
                    context: context,
                    builder: (context) {
                      return CustomPaymentDialog(
                        title:'Card Information' ,
                        sub: 'Receive your payment.',
                        buttonText: 'Done',
                        cardList: sellDetailsController.cardList,
                        selectedCard: sellDetailsController.selectedCard,
                        onSelect: (value) {
                          if (value != null) {
                            sellDetailsController.selectedCard.value = value;
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          if (sellModel.status == 'Accepted')
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: SellAccept(),
            ),
        ],
      ),
    );
  }
}
