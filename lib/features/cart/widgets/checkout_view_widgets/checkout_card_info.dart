import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CheckoutCardInfo extends GetWidget<CheckoutController> {
  const CheckoutCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      radius: 16.r,
      border: Border.all(color: AppColors.fieldBorderColorLight, width: 1.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: "Saved Card Details",
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
            ),
            SizedBox(height: 12.h),
            Column(
              children: List.generate(controller.cardList.length, (index) {
                final item = controller.cardList[index];
                return Obx(() {
                  final isSelected =
                      controller.selectedCardIndex.value == index;
                  return GestureDetector(
                    onTap: () => controller.selectedCardIndex.value = index,
                    child: SharedContainer(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(12.w),
                      radius: 16.r,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.fieldBorderColorLight,
                        width: 1.2.w,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            item["image"]!,
                            width: 30.w,
                            height: 20.h,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomPrimaryText(
                                  text: item["number"]!,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.lightGreyColor,
                                ),
                                SizedBox(height: 4.h),
                                CustomPrimaryText(
                                  text: item["name"]!,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryTextColor,
                                ),
                                SizedBox(height: 2.h),
                                CustomPrimaryText(
                                  text: item["expiry"]!,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              CheckoutHelper().icon(
                                icon: IconsPath.pen,
                                onTap: () {},
                              ),
                              CheckoutHelper().icon(
                                icon: IconsPath.delete,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
