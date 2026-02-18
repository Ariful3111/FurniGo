import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/page_count.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPropertyTypeView extends StatelessWidget {
  const RentPropertyTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    RentPropertyTypeController propertyTypeController = Get.find();
    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: PageCount(text: 'Property Type')),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 24.h),
          CustomPrimaryText(
            text: 'Property Details',
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
          SizedBox(height: 26.h),
          CustomPrimaryText(
            text: 'Property Type *',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTextColor,
          ),
          SizedBox(height: 8.h),
          CustomDropdownMenu(
            onSelect: (value) {
              propertyTypeController.selectedPropertyType.value = value!;
            },
            option: propertyTypeController.properType,
            isSelect: propertyTypeController.selectedPropertyType,
            label: 'Select Property Type',
          ),
          SizedBox(height: 32.h),
          CustomPrimaryText(
            text: 'Property Use *',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTextColor,
          ),
          SizedBox(height: 8.h),
          CustomDropdownMenu(
            onSelect: (value) {
              propertyTypeController.selectedPropertyUse.value = value!;
            },
            option: propertyTypeController.properUse,
            isSelect: propertyTypeController.selectedPropertyUse,
            label: 'Select Property Use',
          ),
        ],
      ),
    );
  }
}
