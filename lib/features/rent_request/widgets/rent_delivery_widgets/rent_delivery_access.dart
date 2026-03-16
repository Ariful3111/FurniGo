import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_delivery_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDeliveryAccess extends GetWidget<RentDeliveryController> {
  const RentDeliveryAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(controller.access.length, (index) {
        final item = controller.access[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: item['title'],
              fontSize: 14.sp,
              color: AppColors.titleTextColor,
            ),
            SizedBox(height: 12.h),
            Row(
              children: List.generate(item['Option'].length, (index) {
              return SizedBox(
                width: 171.w,
                child: Row(
                  children: [
                    Obx(
                      () => CustomRadioButton(
                        value: index,
                        groupValue: item['selectedOption'].value,
                        onChange: (value) {
                          item['selectedOption'].value = value!;
                        },
                      ),
                    ),
                    CustomPrimaryText(
                      text: item['Option'][index],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkColor,
                    ),
                  ],
                ),
              );
            }),
            ),
          ],
        );
      }),
    );
  }
}
