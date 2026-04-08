import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:get/get.dart';

class ProductDetailsTab extends GetWidget<ProductDetailsController> {
  const ProductDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedContainer(
            padding: EdgeInsets.all(8.w),
            radius: 60.r,
            color: isDark ? AppColors.labelColor : Color(0xFFF4F6F8),
            child: Obx(() {
              return Row(
                children: List.generate(controller.tabs.length, (index) {
                  final isSelected = controller.selectedIndex.value == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = index;
                      },
                      child: SharedContainer(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        color: isSelected
                            ? AppColors.whiteColor
                            : Colors.transparent,
                        radius: 60.r,
                        child: CustomPrimaryText(
                          text: controller.tabs[index],
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                          textOverflow: TextOverflow.ellipsis,
                          color: isSelected
                              ? AppColors.darkTextColor
                              : isDark
                              ? AppColors.whiteColor
                              : AppColors.darkTextColor,
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
          SizedBox(height: 12.h),
          Obx(() {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (Widget child, Animation<double> animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: Offset(0.1, 0.0),
                  end: Offset.zero,
                ).animate(animation);

                return SlideTransition(
                  position: offsetAnimation,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: KeyedSubtree(
                key: ValueKey(controller.selectedIndex.value),
                child: controller.widgets[controller.selectedIndex.value],
              ),
            );
          }),
        ],
      ),
    );
  }
}
