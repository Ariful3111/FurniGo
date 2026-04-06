import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CheckoutAddress extends GetWidget<CheckoutController> {
  const CheckoutAddress({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return Column(
        children: List.generate(controller.addressList.length, (index) {
          final data = controller.addressList[index];
          return GestureDetector(
            onTap: () => controller.selectedAddress.value = index,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SharedContainer(
                padding: EdgeInsets.all(16),
                radius: 16,
                border: Border.all(
                  color: controller.selectedAddress.value == index
                      ? AppColors.primaryColor
                      : (isDark
                            ? AppColors.darkBorderColor
                            : AppColors.grayBorderColor),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomPrimaryText(
                                text: data["type"],
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              if (data["isDefault"])
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.activeBGColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CustomPrimaryText(
                                    text: "Default",
                                    fontSize: 12,
                                    color: AppColors.activeTextColor,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 6),
                          CustomPrimaryText(text: data["name"], fontSize: 16),
                          SizedBox(height: 6),
                          CustomPrimaryText(text: data["address1"]),
                          CustomPrimaryText(text: data["address2"]),
                          CustomPrimaryText(text: data["country"]),
                        ],
                      ),
                    ),
                    CustomRadioButton(
                      value: 1,
                      groupValue: controller.selectedAddress.value == index
                          ? 1
                          : 0,
                      onChange: (value) {
                        controller.selectedAddress.value = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
