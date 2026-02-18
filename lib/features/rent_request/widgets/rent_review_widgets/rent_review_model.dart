import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class RentReviewModel extends StatelessWidget {
  final String title;
  final List data;
  const RentReviewModel({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color:isDark?AppColors.whiteColor: AppColors.darkTextColor,
        ),
        SizedBox(height: 18.h),
        DetailsRowModel( data: data),
        if (title != 'Delivery Details') SizedBox(height: 20.h),
        if (title != 'Delivery Details') CustomDivider(),
      ],
    );
  }
}
