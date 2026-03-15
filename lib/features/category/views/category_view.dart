import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/controller/dashboard_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CategoryView extends GetView<DashboardController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(title: 'Category', isIcon: false, onDrawerTap: () {}),
          SizedBox(height: 20.h),
          SharedContainer(
            radius: 16.r,
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: List.generate(controller.quickAction.length, (
                index,
              ) {
                final item = controller.quickAction[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(item['page']);
                  },
                  child: SharedContainer(
                    width: MediaQuery.widthOf(context),
                    margin: EdgeInsets.only(
                      bottom:
                          controller.quickAction.length - 1 == index
                          ? 0
                          : 8.h,
                    ),
                    radius: 12.r,
                    padding: EdgeInsets.all(12.r),
                    border: Border.all(
                      width: 0.68.r,
                      color: isDark
                          ? AppColors.darkBorderColor
                          : AppColors.borderColor,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: -0,
                          child: Image.asset(
                            IconsPath.categoryContainer,
                            height: 109.w,
                            width: 90.h,
                            color: AppColors.whiteColor.withValues(alpha: 0.2),
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item['icon'],
                              height: 40.h,
                              width: 40.w,
                            ),
                            SizedBox(height: 12.h),
                            CustomPrimaryText(
                              text: item['title'],
                              fontSize: 16.sp,
                            ),
                            SizedBox(height: 8.h),
                            CustomPrimaryText(
                              text: item['sub'],
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w300,
                              color: isDark
                                  ? AppColors.primaryBorderColor
                                  : AppColors.greyTextColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
