import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_headar.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_list.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditUsageCard extends StatelessWidget {
  const CreditUsageCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(24.r),
      color: isDark ? AppColors.labelColor : AppColors.whiteColor,
      radius: 16,
      boxShadow: [
        BoxShadow(
          color: AppColors.darkColor.withValues(alpha: 0.15),
          blurRadius: 30,
          offset: Offset(0, 4),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreditHeader(),
          SizedBox(height: 20),
          CreditChart(),
          SizedBox(height: 24),
          CreditTransactionList(),
        ],
      ),
    );
  }
}
