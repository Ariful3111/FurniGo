import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CheckoutShipping extends GetWidget<CheckoutController> {
  CheckoutShipping({super.key});

  final List<Map<String, dynamic>> shippingList = [
    {"title": "Standard Shipping", "subtitle": "3-5 Days", "price": "\$0.00"},
    {"title": "Expedited Shipping", "subtitle": "3-5 Days", "price": "\$18.00"},
    {"title": "Expedited Shipping", "subtitle": "3-5 Days", "price": "\$18.00"},
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: "Shipping Method",
          fontSize: 20.sp,
          color: isDark ? AppColors.whiteColor : AppColors.fieldTextColorDark,
        ),
        SizedBox(height: 16.h),
        Column(
          children: List.generate(shippingList.length, (index) {
            bool isFirst = index == 0;
            bool isLast = index == shippingList.length - 1;
            final data = shippingList[index];
            return GestureDetector(
              onTap: () => controller.selectedIndex.value = index,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFBEBEBE)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isFirst ? 12.r : 0),
                    topRight: Radius.circular(isFirst ? 12.r : 0),
                    bottomLeft: Radius.circular(isLast ? 12.r : 0),
                    bottomRight: Radius.circular(isLast ? 12.r : 0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => CustomRadioButton(
                        value: controller.selectedIndex.value,
                        groupValue: index,
                        onChange: (_) => controller.selectedIndex.value = index,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomPrimaryText(
                                text: data["title"],
                                fontSize: 16.sp,
                                color: isDark
                                    ? AppColors.fieldBorderColor
                                    : AppColors.buttonTextColor,
                              ),
                              SizedBox(height: 6.h),
                              CustomPrimaryText(
                                text: data["subtitle"],
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: isDark
                                    ? AppColors.primaryBorderColor
                                    : AppColors.buttonTextColor,
                              ),
                            ],
                          ),
                          CustomPrimaryText(
                            text: data["price"],
                            fontSize: 16.sp,
                            color: AppColors.buttonTextColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        
      ],
    );
  }
}
