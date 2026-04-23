import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/utils/date_picker.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_photos_widgets/purchase_receipt_image.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_photos_widgets/purchase_receipt_more_image.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_date_fields.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProofOfPurchaseField extends GetWidget<SellFlowPhotosController> {
  const ProofOfPurchaseField({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        title(text: 'Purchase Price', isDark: isDark),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller.purchasePriceController,
          labelText: 'Write Purchase price of the products',
        ),
        SizedBox(height: 12.h),
        title(text: 'Purchase Date', isDark: isDark),
        SizedBox(height: 8.h),
        CustomDateField(
          controller: controller.purchaseDateController,
          onTap: () => DatePicker.pickDate(
            context: context,
            lastDate: DateTime.now(),
            onDateSelected: (date) {
              String formattedDate =
                  '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
              controller.purchaseDateController.text = formattedDate;
            },
          ),
          label: 'DD/MM/YYYY',
        ),
        SizedBox(height: 16.h),
        title(text: 'Upload receipt(s)', isDark: isDark),
        SizedBox(height: 8.h),
        Obx(
          () => controller.hasImages()
              ? PurchaseReceiptMoreImage()
              : PurchaseReceiptImage(),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget title({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 14.sp,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    );
  }
}
