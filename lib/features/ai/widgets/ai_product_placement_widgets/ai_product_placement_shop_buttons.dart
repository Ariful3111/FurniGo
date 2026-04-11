import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/ai/widgets/ai_generate_button.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';

class AiProductPlacementShopButtons extends StatelessWidget {
  const AiProductPlacementShopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final String title = args['title'] ?? 'AI';
    final String sub = args['sub'] ?? '';
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomPrimaryButton(
                borderRadius: BorderRadius.circular(16.r),
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                text: "Replace Existing Furniture",
                onPressed: () {},
                backgroundColor: AppColors.whiteColor,
                textColor: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomPrimaryButton(
                borderRadius: BorderRadius.circular(16.r),
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                text: "Use Empty Spot",
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        AiGenerateButton(
          onTap: () {
            Get.toNamed(
              AppRoutes.aiProductPlacementRegenerateView,
              arguments: {'title': title, 'sub': sub},
            );
          },
        ),
      ],
    );
  }
}
