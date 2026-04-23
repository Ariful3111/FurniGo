import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProofOfPurchaseHeader extends GetWidget<SellFlowPhotosController> {
  const ProofOfPurchaseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPrimaryText(
              text: 'Proof of purchase (optional)',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.titleColor,
            ),
            Obx(
              () => InkWell(
                onTap: () => controller.isExpanded.toggle(),
                child: AnimatedRotation(
                  turns: controller.isExpanded.value ? 0.5 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Image.asset(
                    IconsPath.downArrow,
                    width: 20.w,
                    height: 20.h,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text: 'Product: Chair',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.titleColor,
        ),
        SizedBox(height: 4.h),
        CustomPrimaryText(
          text: 'Upload receipts or documents to help verify brand and value.',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
      ],
    );
  }
}
