import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_brand_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/page_count.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_brand_widgets/rent_brand_details.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentBrand extends StatelessWidget {
  const RentBrand({super.key});

  @override
  Widget build(BuildContext context) {
    RentBrandController rentBrandController = Get.find();
    return SharedContainer(
      child: Column(
        children: [
          PageCount(text: 'Furniture Requirements'),
          SizedBox(height: 20.h),
          propertyDivider(),
          optionContainer(
            context: context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: 'Branding Required?',
                        fontSize: 14.sp,
                        color: AppColors.darkTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text:
                            'Add your logo, colors, or custom design to furniture and display areas.',
                        fontSize: 14.sp,
                        color: Color(0xFF6A7282),
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  return CustomSwitchButton(
                    isOn: rentBrandController.isBrand.value,
                    onChanged: (value) {
                      rentBrandController.isBrand.value = value;
                    },
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          RentBrandDetails(),
        ],
      ),
    );
  }
}
