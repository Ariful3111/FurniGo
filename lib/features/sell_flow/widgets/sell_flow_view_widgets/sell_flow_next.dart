import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_success_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellFlowNext extends GetWidget<SellFlowController> {
  const SellFlowNext({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final isLast =
          controller.currentIndex.value >= controller.sellWidgets.length - 1;
      return isLast
          ? CustomPrimaryButton(
              text: 'Submit for admin review',
              backgroundColor: AppColors.successColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomPaymentSuccessDialog(
                      height: 355.h,
                      icon: IconsPath.success,
                      title: 'Your Request has been submitted',
                      sub:
                          'Our team has received your furniture details and photos.We\'ll review the item and update you soon.',
                      widget: Row(
                        children: [
                          Image.asset(
                            IconsPath.clock,
                            height: 16.h,
                            width: 16.w,
                          ),
                          SizedBox(width: 6.w),
                          CustomPrimaryText(
                            text: 'Estimated review time:24-48 hours',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.labelColor,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )
          : RentHelper.myButton(
              color: AppColors.primaryColor,
              onTap: () {
                if (!isLast) {
                  controller.sellFlowController.animateTo(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                    controller.sellFlowController.position.minScrollExtent,
                  );
                  controller.currentIndex.value++;
                } else {
                  debugPrint('Submit form');
                }
              },
              child: Row(
                children: [
                  CustomPrimaryText(
                    text: 'Next',
                    fontSize: 14.sp,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.arrow_forward,
                    size: 12.r,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            );
    });
  }
}
