import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_helper.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_payment_field.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_payment_paypal.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CheckoutPayment extends GetWidget<CheckoutController> {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: "Payment",
          fontWeight: FontWeight.w600,
          color: AppColors.labelColor,
        ),
        SizedBox(height: 16.h),
        Obx(
          () => SharedContainer(
            padding: EdgeInsets.zero,
            border: Border.all(color: AppColors.grayBorderColor),
            radius: 12.r,
            child: Column(
              children: [
                InkWell(
                  onTap: () => controller.selectedMethod.value = 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Row(
                      children: [
                        CheckoutHelper().paymentTile(
                          title: "Credit Card",
                          value: 0,
                          controller: controller,
                        ),
                        Spacer(),
                        Image.asset(IconsPath.fedx, height: 24.h, width: 48.w),
                        SizedBox(width: 8.w),
                        Image.asset(IconsPath.dropOf, height: 24.h, width: 48.w),
                      ],
                    ),
                  ),
                ),
                AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  child: controller.selectedMethod.value == 0
                      ? Column(
                          children: [CustomDivider(color: AppColors.grayBorderColor,), CheckoutPaymentField()],
                        )
                      : SizedBox(),
                ),
                CustomDivider(color: AppColors.grayBorderColor,),
                CheckoutPaymentPaypal()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
