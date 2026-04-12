import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_generate_button.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';

class AiProductPlacementShopButtons
    extends GetWidget<AiProductPlacementController> {
  const AiProductPlacementShopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final args = Get.arguments ?? {};
    final String title = args['title'] ?? 'AI';
    final String sub = args['sub'] ?? '';
    List option = ['Replace Existing Furniture', 'Use Empty Spot'];
    return Column(
      children: [
        Row(
          children: List.generate(option.length, (index) {
            return Obx(() {
              final selected = controller.isReplace.value == index;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: option.length - 1 == index ? 0 : 8.w,
                  ),
                  child: CustomPrimaryButton(
                    borderRadius: BorderRadius.circular(16.r),
                    fontSize: 12.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    text: option[index],
                    onPressed: () {
                      controller.isReplace.value = index;
                    },
                    backgroundColor: selected
                        ? isDark
                              ? AppColors.boxColor
                              : AppColors.primaryColor
                        : isDark
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    textColor: selected
                        ? isDark
                              ? AppColors.primaryColor
                              : AppColors.whiteColor
                        : isDark
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  ),
                ),
              );
            });
          }),
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
