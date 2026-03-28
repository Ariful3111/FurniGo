import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/payment/controller/payment_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';

class EftPaymentSaveButton extends GetWidget<PaymentController> {
  const EftPaymentSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: controller.isEdit.value
            ? Column(
                key: ValueKey('Save'),
                children: [
                  SizedBox(height: 12.h),
                  CustomPrimaryButton(
                    boxShadow: [
                      boxShadow(dy: 2, blurRadius: 4, alpha: 0.1),
                      boxShadow(dy: 7, blurRadius: 7, alpha: 0.09),
                      boxShadow(dy: 16, blurRadius: 10, alpha: 0.05),
                      boxShadow(dy: 28, blurRadius: 11, alpha: 0.01),
                      boxShadow(dy: 44, blurRadius: 12, alpha: 0.0),
                    ],
                    width: 150.w,
                    text: 'Save Changes',
                    onPressed: () {
                      controller.isEdit.value = !controller.isEdit.value;
                    },
                  ),
                ],
              )
            : SizedBox.shrink(key: ValueKey('empty')),
      ),
    );
  }

  BoxShadow boxShadow({
    required double dy,
    required double blurRadius,
    required double alpha,
  }) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: blurRadius,
      color: AppColors.darkColor.withValues(alpha: alpha),
    );
  }
}
