import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AddItemDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  const AddItemDialog({
    super.key,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          height: 220.h,
          decoration: BoxDecoration(
            color: isDark ? AppColors.labelColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                  ),
                ),
              ),
              CustomPrimaryText(text: 'Add Item'),
              SizedBox(height: 8.h),
              CustomTextFormField(
                controller: controller,
                labelText: 'Enter Item Name',
              ),
              SizedBox(height: 20.h),
              CustomPrimaryButton(text: 'Add Item', onPressed: onTap),
            ],
          ),
        ),
      ),
    );
  }
}
