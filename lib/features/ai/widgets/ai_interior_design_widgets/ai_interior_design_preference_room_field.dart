import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AiInteriorDesignPreferenceRoomField extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceRoomField({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SizedBox(height: 12.h),
        _inputField("Length", controller.lengthController, isDark),
        SizedBox(height: 12.h),
        _inputField("Width", controller.widthController, isDark),
        SizedBox(height: 12.h),
        _inputField("Ceiling height", controller.heightController, isDark),
      ],
    );
  }
  Widget _inputField(
    String title,
    TextEditingController controller,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 12.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(controller: controller, hintText: "Enter $title"),
      ],
    );
  }
}