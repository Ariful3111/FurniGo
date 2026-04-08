import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/credit_balance/controller/credit_balance_controller.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_transaction_model.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart';
import 'package:zb_dezign/shared/widgets/custom_scrollbar.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditTransactionList extends GetWidget<CreditBalanceController> {
  const CreditTransactionList({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final List<CreditTransaction> items = [
      CreditTransaction(
        title: "Room interior design",
        date: "12/12/2025, 5:40 PM",
        amount: -15,
      ),
      CreditTransaction(
        title: "Credit added",
        date: "12/12/2025, 5:40 PM",
        amount: 200,
      ),
      CreditTransaction(
        title: "Product placement",
        date: "12/12/2025, 5:40 PM",
        amount: -20,
      ),
      CreditTransaction(
        title: "Room interior design",
        date: "12/12/2025, 5:40 PM",
        amount: -15,
      ),
      CreditTransaction(
        title: "Credit added",
        date: "12/12/2025, 5:40 PM",
        amount: 200,
      ),
      CreditTransaction(
        title: "Product placement",
        date: "12/12/2025, 5:40 PM",
        amount: -20,
      ),
      CreditTransaction(
        title: "Room interior design",
        date: "12/12/2025, 5:40 PM",
        amount: -15,
      ),
      CreditTransaction(
        title: "Credit added",
        date: "12/12/2025, 5:40 PM",
        amount: 200,
      ),
      CreditTransaction(
        title: "Product placement",
        date: "12/12/2025, 5:40 PM",
        amount: -20,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SharedContainer(
          width: 105.w,
          padding: EdgeInsets.symmetric(vertical: 4.18.h, horizontal: 8.35.w),
          radius: 32.67.r,
          color: isDark ? AppColors.darkColor : AppColors.primaryBorderColor,
          child: Row(
            children: [
              CustomPrimaryText(
                text: 'This Month',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.labelColor,
              ),
              SizedBox(width: 2.w),
              Image.asset(
                IconsPath.downArrow,
                height: 8.53.h,
                width: 10.96.w,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.labelColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 220.h,
          child: CustomScrollbar(
            scrollController: controller.scrollController,
            child: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: ListView.builder(
                controller: controller.scrollController,
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CreditTransactionItem(transaction: items[index]);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
