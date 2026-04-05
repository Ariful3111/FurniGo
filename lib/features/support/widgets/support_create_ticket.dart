import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/support/controller/support_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SupportCreateTicket extends GetWidget<SupportController> {
  const SupportCreateTicket({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(text: "Create New Ticket", size: 16.sp, isDark: isDark),
          SizedBox(height: 24.h),
          text(text: "Subject", isDark: isDark),
          CustomTextFormField(
            controller: controller.subjectController,
            labelText: "Brief description of the issue",
          ),
          SizedBox(height: 12.h),
          text(text: "Category", isDark: isDark),
          CustomDropdownMenu(
            label: 'Select Category',
            option: controller.categories,
            isSelect: controller.selectedCategory,
            onSelect: (value) {
              controller.selectedCategory.value = value ?? "";
            },
          ),
          SizedBox(height: 20.h),
          text(text: "Order ID (Optional)", isDark: isDark),
          CustomTextFormField(
            controller: controller.orderIdController,
            labelText: "#ORD-...",
          ),
          SizedBox(height: 20.h),
          text(text: "Message", isDark: isDark),
          CustomTextFormField(
            controller: controller.messageController,
            labelText: "Describe your issue in detail...",
            isAlignLabelWithHint: true,
            maxLines: 6,
            fillColor:isDark?AppColors.labelColor :Color(0xFFF3F3F3),
          ),
          SizedBox(height: 24.h),
          Align(
            alignment: Alignment.center,
            child: CustomPrimaryButton(
              text: "Submit Ticket",
              onPressed: () {},
              width: 140.w,
              boxShadow: [
                shadow(dy: 44, blurRadius: 12, alpha: 0.0),
                shadow(dy: 28, blurRadius: 11, alpha: 0.01),
                shadow(dy: 16, blurRadius: 10, alpha: 0.05),
                shadow(dy: 7, blurRadius: 7, alpha: 0.09),
                shadow(dy: 2, blurRadius: 4, alpha: 0.1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget text({required String text, required bool isDark, double? size}) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 6.h),
      child: CustomPrimaryText(
        text: text,
        fontSize: size ?? 14.sp,
        fontWeight: FontWeight.w600,
        color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
      ),
    );
  }

  BoxShadow shadow({
    required double dy,
    required double blurRadius,
    required double alpha,
  }) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: blurRadius,
      color: AppColors.shadowColor.withValues(alpha: alpha),
    );
  }
}
