import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsRatingPercent extends StatelessWidget {
  final int star;
  final double percent;
  final bool isDark;

  const ProductDetailsRatingPercent({
    super.key,
    required this.star,
    required this.percent,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 8.h,
            percent: percent,
            padding: EdgeInsets.zero,
            barRadius: Radius.circular(6.r),
            backgroundColor: AppColors.fieldBorderColor,
            progressColor: Color(0xFFECB900),
          ),
        ),
        SizedBox(width: 12.w),
        Row(
          children: [
            CustomPrimaryText(
              text: "$star.0",
              fontSize: 14.sp,
              color: isDark
                  ? AppColors.whiteColor
                  : AppColors.darkTextColor,
            ),
            SizedBox(width: 4.w),
            Icon(
              Icons.star,
              size: 16.sp,
              color: Color(0xFFECB900),
            ),
          ],
        ),
      ],
    );
  }
}
