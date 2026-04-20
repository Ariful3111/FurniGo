import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/ai/controller/ai_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_dropdown_upgrade.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AiDropdownCredit extends GetWidget<AiController> {
  const AiDropdownCredit({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: 300.w,
        constraints: BoxConstraints(maxHeight: 400.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors:isDark? [AppColors.labelColor,AppColors.labelColor]:[AppColors.fieldBorderColor, AppColors.whiteColor],
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CustomPrimaryText(
                      text: "Credit Usage",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark?AppColors.whiteColor:AppColors.darkColor,
                    ),
                    Spacer(),
                    Image.asset(
                      IconsPath.creditCoin,
                      height: 10.h,
                      width: 10.w,
                      color: isDark?AppColors.whiteColor:AppColors.darkColor,
                    ),
                    SizedBox(width: 4.w),
                    CustomPrimaryText(
                      text: "Balance: 1250",
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark?AppColors.whiteColor:AppColors.darkColor,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        CreditChart(),
                        SizedBox(height: 16.h),
                        ...List.generate(
                          controller.creditItems.length,
                          (index) => CreditTransactionItem(
                            transaction: controller.creditItems[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AiDropdownUpgrade(),
            ),
          ],
        ),
      ),
    );
  }
}
