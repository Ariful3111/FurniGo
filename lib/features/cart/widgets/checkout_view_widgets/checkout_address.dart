import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
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
                      ?isDark? AppColors.primaryBorderColor:AppColors.primaryColor
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
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(width: 8.w),
                              if (data["isDefault"])
                                CustomTableStatus(status: 'Default'),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          CustomPrimaryText(
                            text: data["name"],
                            fontSize: 16.sp,
                            color:isDark? AppColors.whiteColor: AppColors.lightGreyColor,
                          ),
                          SizedBox(height: 6.h),
                          text(text: data["address1"], isDark: isDark),
                          text(text: data["address2"], isDark: isDark),
                          text(text: data["country"], isDark: isDark),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomRadioButton(
                          value: 1,
                          groupValue: controller.selectedAddress.value == index
                              ? 1
                              : 0,
                          onChange: (value) {
                            controller.selectedAddress.value = value;
                          },
                        ),
                        SizedBox(height: 50.h),
                        Row(
                          children: [
                            CheckoutHelper().icon(
                              icon: IconsPath.pen,
                              onTap: () {},
                            ),
                            SizedBox(width: 8.w),
                            CheckoutHelper().icon(
                              icon: IconsPath.delete,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
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

  Widget text({required String text,required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color:isDark? AppColors.primaryBorderColor: AppColors.secondaryTextColor,
    );
  }
}
