import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/payment/controller/payment_controller.dart';
import 'package:zb_dezign/features/payment/widgets/add_payment_method_dialog_field.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AddPaymentMethodDialog extends GetWidget<PaymentController> {
  const AddPaymentMethodDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SharedContainer(
        height: 527.h,
        width: MediaQuery.widthOf(context),
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPrimaryText(
                        text: "Add Payment Method",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkColor,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          IconsPath.close,
                          height: 20.h,
                          width: 20.w,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.darkColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  CustomPrimaryText(
                    text:
                        "Securely save your card for faster checkout and instalments.",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.greyTextColor,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              CustomDivider(),
              SizedBox(height: 24.h),
              AddPaymentMethodDialogField(
                title: "Card Number",
                controller: controller.cardController,
                label: 'Enter Your Card Number',
              ),
              SizedBox(height: 12.h),
              AddPaymentMethodDialogField(
                title: "Expiry Date",
                controller: controller.expiryController,
                label: 'Enter Your Card Expiry Date',
              ),
              SizedBox(height: 12.h),
              AddPaymentMethodDialogField(
                title: "CVV",
                controller: controller.cvvController,
                label: 'Enter Your Card CVV Number',
              ),
              SizedBox(height: 24.h),
              Row(
                children: List.generate(4, (i) {
                  return Padding(
                    padding: EdgeInsets.only(right: 18.w),
                    child: Image.asset(IconsPath.visa, width: 34.w, height: 24.h),
                  );
                }),
              ),
              SizedBox(height: 24.h),
              CustomPrimaryButton(text: 'Save', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
