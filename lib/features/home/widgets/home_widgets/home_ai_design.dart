import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_ai_design_step.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_ai_slider.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_placement_place.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class HomeAiDesign extends StatelessWidget {
  const HomeAiDesign({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      color:isDark? Color(0xFF101010):Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      radius: 0.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'AI Room Interior Design',
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          SizedBox(height: 16.h),
          SharedContainer(
            padding: EdgeInsets.all(12.r),
            border: Border.all(
              width: 1.r,
              color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
            ),
            child: Column(
              children: [
                HomeAiDesignStep(),
                SizedBox(height: 12.h,),
                SharedContainer(
                  height: 224.w,
                  border: Border.all(width: 4.r,color: AppColors.whiteColor),
                  padding: EdgeInsets.zero,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2.37),
                      blurRadius: 8.3,
                      color: AppColors.shadowColor.withValues(alpha: 0.1),
                    ),
                  ],
                  child: HomeAiSlider(),
                ),
                SizedBox(height: 12.h),
                HomeProductPlacementPlace(
                  text: 'Make Your Interior Design',
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.aiInteriorDesignView,
                      arguments: {
                        'title': 'Interior Design',
                        'sub':
                            'Transform Your Room With AI.',
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
