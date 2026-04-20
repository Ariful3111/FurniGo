import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_details_controller.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_details_widgets/transaction_details_info_button.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class TransactionDetailsInfo extends GetWidget<TransactionDetailsController> {
  const TransactionDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Transaction Details',
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: 'Complete overview of your payment activity',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.primaryBorderColor
                : AppColors.greyTextColor,
          ),
          SizedBox(height: 26.h),
          ...List.generate(controller.transactionInfo.length, (index) {
            final item = controller.transactionInfo[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: controller.transactionInfo.length - 1 == index
                    ? 0
                    : 12.0.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: item['title'] == 'Status' ? 1 : 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CustomPrimaryText(
                        text: item['title'],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkTextColor,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomPrimaryText(
                        text: ':',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkTextColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  item['title'] == 'Payment Method'
                      ? Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              CustomPrimaryText(
                                text: item['value'],
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: isDark
                                    ? AppColors.whiteColor
                                    : AppColors.darkTextColor,
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Image.asset(
                                    IconsPath.visa,
                                    height: 20.h,
                                    width: 32.w,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: CustomPrimaryText(
                                      text: '546545454',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: isDark
                                          ? AppColors.whiteColor
                                          : AppColors.darkTextColor,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          flex: item['title'] == 'Status' ? 1 : 2,
                          child: item['title'] == 'Status'
                              ? CustomTableStatus(
                                  status:
                                      controller.transactionModel.status ?? '',
                                )
                              : Align(
                                  alignment: Alignment.topRight,
                                  child: CustomPrimaryText(
                                    text: item['value'],
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: item['title'] == 'Charged Amount'
                                        ? Color(0xFFAF1D38)
                                        : isDark
                                        ? AppColors.whiteColor
                                        : AppColors.darkTextColor,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                        ),
                ],
              ),
            );
          }),
          SizedBox(height: 45.h),
          TransactionDetailsInfoButton(),
        ],
      ),
    );
  }
}
