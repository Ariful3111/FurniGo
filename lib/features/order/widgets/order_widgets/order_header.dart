import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/order/controller/order_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderHeader extends GetWidget<OrderController> {
  const OrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation);
          return ClipRect(
            child: SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(opacity: animation, child: child),
            ),
          );
        },
        child: controller.isSearch.value
            ? SizedBox(
                key: ValueKey('Field'),
                child: CustomTextFormField(
                  border: BorderSide.none,
                  labelText: 'Search Your Order',
                  maxLines: 1,
                  borderRadius: 12.r,
                  controller: controller.orderController,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: InkWell(
                      onTap: () {
                        controller.isSearch.value = !controller.isSearch.value;
                      },
                      child: Image.asset(
                        IconsPath.search,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                ),
              )
            : SharedContainer(
                key: ValueKey('Header'),
                padding: EdgeInsets.all(12.r),
                radius: 12.r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomPrimaryText(
                      text: 'My Order',
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.titleColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        button(
                          imagePath: IconsPath.download,
                          onTap: () {},
                          isDark: isDark,
                        ),
                        SizedBox(width: 8.w),
                        button(
                          imagePath: IconsPath.search,
                          onTap: () {
                            controller.isSearch.value =
                                !controller.isSearch.value;
                          },
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      );
    });
  }

  Widget button({
    required String imagePath,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: isDark ? AppColors.labelColor : AppColors.whiteColor,
          border: Border.all(
            width: 0.8.r,
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.fieldBorderColorLight,
          ),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: 14.h,
            width: 14.w,
            color: isDark ? AppColors.whiteColor : null,
          ),
        ),
      ),
    );
  }
}
