import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/credit_balance/controller/credit_balance_controller.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_items.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditSection extends StatelessWidget {
  const CreditSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
        CreditBalanceController creditBalanceController = Get.find();
    return Column(
      children: [
        SharedContainer(
          radius: 32.r,
          border: Border.all(
            color: isDark ? AppColors.darkBorderColor : AppColors.whiteColor,
            width: 4,
          ),
          gradient: isDark
              ? AppColors.darkAuthBG
              : LinearGradient(
                  end: Alignment.bottomLeft,
                  begin: Alignment.topRight,
                  colors: [
                    Color(0xFFD3EBFF),
                    Color(0xFFE8F5FF),
                    Colors.white,
                    Colors.white,
                  ],
                ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withValues(alpha: 0.1),
              blurRadius: 41.4,
              offset: const Offset(0, 11.83),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: "Purchase Credits",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.titleTextColor,
              ),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text: "Choose a credit pack that fits your design needs",
                fontSize: 14.sp,
                color: isDark
                    ? AppColors.darkPrimaryTextColor
                    : AppColors.secondaryTextColor,
              ),
              SizedBox(height: 24.h),
              CreditItems(),
              SizedBox(height: 24.h),
              CustomPrimaryButton(
                text: "Proceed to Payment",
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  showDialog(
                context: context,
                builder: (context) {
                  return CustomPaymentDialog(
                    cardList: creditBalanceController.cardList,
                    selectedCard: creditBalanceController.selectedCard,
                    onSelect: (value) {
                      creditBalanceController.selectedCard.value = value!;
                    },
                    icon: IconsPath.success,
                  );
                },
              );
                },
                boxShadow: [
                  shadow(dy: 98, blurRadius: 28, alpha: 0.0),
                  shadow(dy: 63, blurRadius: 25, alpha: 0.01),
                  shadow(dy: 35, blurRadius: 21, alpha: 0.05),
                  shadow(dy: 16, blurRadius: 16, alpha: 0.09),
                  shadow(dy: 4, blurRadius: 9, alpha: 0.1),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  BoxShadow shadow({
    required double dy,
    required double blurRadius,
    required double alpha,
  }) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: blurRadius,
      color: AppColors.shadowColor.withValues(alpha: alpha),
    );
  }
}
