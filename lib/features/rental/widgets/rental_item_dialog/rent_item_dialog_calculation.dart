import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentItemDialogCalculation extends StatelessWidget {
  const RentItemDialogCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalQuotesController controller = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Obx(() {
        return Column(
          children: [
            _buildSummaryRow(
              label: 'Subtotal',
              value: '\$400',
              isDark: isDark,
            ),
            SizedBox(height: 12.h),
            _buildSummaryRow(
              label: 'Discount (3%)',
              value: '-\$20',
              isDark: isDark,
            ),
            SizedBox(height: 12.h),
            _buildSummaryRow(
              label: 'Setup Charge',
              value: '\$20',
              isDark: isDark,
            ),
            SizedBox(height: 12.h),
            _buildSummaryRow(
              label: 'Total:',
              value: '\$400',
              isDark: isDark,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: CustomPrimaryButton(
                    height: 40.h,
                    onPressed: () => Get.back(),
                    text: controller.hasResetItem
                        ? 'Request Revision'
                        : 'Accept',
                    fontSize: 12.sp,
                    
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomPrimaryButton(
                    height: 40.h,
                    text: 'Decline',
                    onPressed: () {},
                    fontSize: 12.sp,
                    backgroundColor: AppColors.whiteColor,
                    border: Border.all(
                      width: 1.r,
                      color: AppColors.buttonBorderColor,
                    ),
                    textColor: Color(0xFFE7000B),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _buildSummaryRow({
    required String label,
    required String value,
    required bool isDark,
    FontWeight? fontWeight,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: label,
          fontSize: 18.sp,
          fontWeight: fontWeight,
          color: isDark ? AppColors.whiteColor : AppColors.buttonTextColor,
        ),
        CustomPrimaryText(
          text: value,
          fontSize: 16.sp,
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.buttonTextColor,
        ),
      ],
    );
  }
}
