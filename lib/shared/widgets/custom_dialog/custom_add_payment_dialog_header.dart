import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomAddPaymentDialogHeader extends StatelessWidget {
  const CustomAddPaymentDialogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPrimaryText(
              text: 'Add Payment Method',
              fontSize: 16.sp,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                IconsPath.close,
                height: 16.h,
                width: 16.w,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.darkTextColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: 280.w,
          child: CustomPrimaryText(
            text:
                'Securely save your card for faster checkout and instalments.',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.primaryBorderColor
                : AppColors.greyTextColor,
          ),
        ),
        SizedBox(height: 12.h),
        CustomDivider(),
      ],
    );
  }
}
