import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_delivery_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellFlowDeliveryOption extends GetWidget<SellFlowDeliveryController> {
  const SellFlowDeliveryOption({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Row(
        children: List.generate(controller.options.length, (index) {
          final item = controller.options[index];
          final bool isSelected = controller.selectedIndex.value == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                controller.selectedIndex.value = index;
              },
              child: SharedContainer(
                margin: EdgeInsets.only(
                  right: controller.options.length - 1 == index ? 0 : 12.w,
                ),
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                radius: 16.r,
                border: Border.all(
                  color: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.buttonBorderColor,
                  width: 1.r,
                ),
                color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                child: Row(
                  children: [
                    CustomRadioButton(
                      value: index,
                      groupValue: controller.selectedIndex.value,
                      onChange: (val) {
                        controller.selectedIndex.value = val;
                      },
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPrimaryText(
                            text: item["title"] ?? "",
                            fontSize: 16.sp,
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.darkColor,
                            textOverflow: TextOverflow.ellipsis,
                          ),

                          if (item["subtitle"]!.isNotEmpty) ...[
                            SizedBox(height: 2.h),
                            CustomPrimaryText(
                              text: item["subtitle"]!,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: isDark
                                  ? AppColors.primaryBorderColor
                                  : AppColors.greyTextColor,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
