import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellFlowViewDetailsFields extends StatelessWidget {
  final ItemFormModel item;

  const SellFlowViewDetailsFields({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: "Item category *",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkColor,
                    ),
                    SizedBox(height: 8.h),
                    CustomDropdownMenu(
                      label: "Select category",
                      isSelect: item.category,
                      option: const ["Chair", "Table", "Sofa", "Bed"],
                      onSelect: (value) {
                        item.category.value = value!;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              item.category.value.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        item.category.value = "";
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Center(
                          child: Image.asset(
                            IconsPath.delete,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),

        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: "Brand",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: item.brandController,
          labelText: "e.g., IKEA, Freedom, Custom",
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: "Dimensions",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: item.dimensionController,
          labelText: "e.g., 200cm x 90cm x 80cm (L x W x H)",
        ),
        SizedBox(height: 6.h),
        CustomPrimaryText(
          text: "Add length x width x height for a more accurate quote.",
          fontSize: 14.sp,
          color: AppColors.greyTextColor,
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: "Age (if known)",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: item.ageController,
          labelText: "e.g., 2 years",
        ),
        SizedBox(height: 6.h),
        CustomPrimaryText(
          text: "If you're not sure, leave it blank.",
          fontSize: 14.sp,
          color: AppColors.greyTextColor,
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: "Condition notes *",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: item.conditionController,
          labelText:
              "Describe any scratches, stains, missing parts, repairs...",
          maxLines: 3,
        ),
        SizedBox(height: 20.h),
        CustomDivider(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
