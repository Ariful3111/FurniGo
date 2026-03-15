import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell/controller/sell_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class SellDetailsSummery extends GetWidget<SellDetailsController> {
  const SellDetailsSummery({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Item summary',
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 18.h),
        DetailsRowModel(data: controller.summary),
      ],
    );
  }
}
