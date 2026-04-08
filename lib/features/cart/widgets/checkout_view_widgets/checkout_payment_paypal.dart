import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';

class CheckoutPaymentPaypal extends GetWidget<CheckoutController> {
  const CheckoutPaymentPaypal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Column(
      children: [
        InkWell(
          onTap: () => controller.selectedMethod.value = 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckoutHelper().paymentTile(
                  title: "PayPal",
                  value: 1,
                  controller: controller,
                ),
                Image.asset(IconsPath.paypal, height: 30.h, width: 48.w),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: controller.selectedMethod.value == 1
              ? Column(
                  children: [
                    CustomDivider(color: AppColors.grayBorderColor,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: CustomTextFormField(
                        controller: controller.paypalEmailController,
                        labelText: 'Enter Your Paypal Email',
                        borderColor: AppColors.grayBorderColor,
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ),
      ],
    ));
  }
}
