import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/payment/controller/payment_controller.dart';
import 'package:zb_dezign/features/payment/widgets/eft_payments.dart';
import 'package:zb_dezign/features/payment/widgets/payment_method.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        controller: controller.scrollController,
        children: [
          CustomAppbar(
            title: 'Payment Method',
            onDrawerTap: () {
              CustomDialogAnimation().showAnimatedDialog(
                context: context,
                dialog: CustomDrawer(),
                isDark: isDark,
              );
            },
          ),
          SizedBox(height: 12.h),
          SharedContainer(
            padding: EdgeInsets.all(12.r),
            radius: 12.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: 'Payment Method',
                  color: isDark ? AppColors.whiteColor : AppColors.titleColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: 'Manage your saved cards and default payment method',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.greyTextColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          PaymentMethod(),
          SizedBox(height: 12.h),
          EftPayments(),
        ],
      ),
    );
  }
}
