import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/payment/controller/payment_controller.dart';
import 'package:zb_dezign/features/payment/widgets/payment_header.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class EftPayments extends GetWidget<PaymentController> {
  const EftPayments({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      child:Obx(()=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentHeader(
            icon1: IconsPath.bank,
            title: 'EFT Payments',
            sub: 'Used for sell payouts or certain payments.',
            icon2: IconsPath.edit,
            buttonText: 'Edit',
            onTap: () {
              controller.isEdit.value = !controller.isEdit.value;
            },
          ),
          SizedBox(height: 6.h),
          CustomDivider(),
          SizedBox(height: 20.h),
          field(
            text: 'Account name',
            controller: controller.nameController,
            isDark: isDark,
            readOnly: !controller.isEdit.value,
          ),
          SizedBox(height: 12.h),
          field(
            text: 'BSB',
            controller: controller.bsbController,
            isDark: isDark,
            readOnly: !controller.isEdit.value,
          ),
          SizedBox(height: 12.h),
          field(
            text: 'Account number',
            controller: controller.accountController,
            isDark: isDark,
            readOnly: !controller.isEdit.value,
          ),
        ],
      )),
    );
  }

  Widget field({
    required String text,
    required TextEditingController controller,
    required bool isDark,
    required bool readOnly,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: isDark ? AppColors.whiteColor : AppColors.titleColor,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: controller,
          borderRadius: 16.r,
          maxLines: 1,
          readOnly: readOnly,
        ),
      ],
    );
  }
}
