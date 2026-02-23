import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/payment_success_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PaymentDialogMethod extends StatelessWidget {
  const PaymentDialogMethod({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPrimaryText(
              text: 'Payment Method',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.labelColor : Color(0xFFFAFBFC),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  width: 1.r,
                  color: AppColors.buttonBorderColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    fontWeight: FontWeight.w900,
                    size: 20.sp,
                    color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                  ),
                  SizedBox(width: 4.w),
                  CustomPrimaryText(
                    text: 'Add Method',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: TextEditingController(),
          borderWidth: 1.2.r,
          borderColor: isDark
              ? AppColors.darkBorderColor
              : AppColors.darkColor.withValues(alpha: 0.08),
          prefixIcon: Padding(
            padding: EdgeInsetsGeometry.only(left: 12.w),
            child: Image.asset(IconsPath.visa, height: 20.h, width: 32.w),
          ),
        ),
        SizedBox(height: 25.h),
        CustomPrimaryButton(
          text: 'Pay Early',
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return PaymentSuccessDialog();
              },
            );
          },
        ),
      ],
    );
  }
}
