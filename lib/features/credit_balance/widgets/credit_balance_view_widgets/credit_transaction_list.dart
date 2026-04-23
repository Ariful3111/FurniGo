import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/credit_balance/controller/credit_balance_controller.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_transaction_model.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown.dart';
import 'package:zb_dezign/shared/widgets/custom_scrollbar.dart';

class CreditTransactionList extends GetWidget<CreditBalanceController> {
  const CreditTransactionList({super.key});
  @override
  Widget build(BuildContext context) {

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
        CustomMonthDropdown(),
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
