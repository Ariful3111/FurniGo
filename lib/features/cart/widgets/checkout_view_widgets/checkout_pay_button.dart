import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_success_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CheckoutPayButton extends StatelessWidget {
  const CheckoutPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        CustomDialogAnimation().showAnimatedDialog(
          context: context,
          dialog: CustomPaymentSuccessDialog(icon: IconsPath.success),
          isDark: isDark,
        );
      },
      child: SharedContainer(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        radius: 60.r,
        color: AppColors.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPrimaryText(
              text: '\$200',
              fontSize: 16.sp,
              color: AppColors.whiteColor,
            ),
            Row(
              children: [
                CustomPrimaryText(
                  text: 'Pay Now',
                  fontSize: 16.sp,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 6.w),
                Icon(
                  Icons.arrow_forward,
                  size: 20.sp,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
