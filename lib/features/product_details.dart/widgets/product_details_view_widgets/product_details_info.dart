import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final List<Map<String, String>> dimensions = [
      {"title": "Width", "value": "H84.5 x W64 x D75 cm"},
      {"title": "Depth", "value": "15.6 kg / 34.4 lbs"},
      {"title": "Height", "value": "23.6 kg / 52 lbs"},
      {"title": "Seat Height", "value": "45 cm"},
      {"title": "Armrest Height", "value": "20 cm"},
      {"title": "Backrest Height", "value": "30 cm"},
      {"title": "Leg Height", "value": "10 cm"},
      {"title": "Max Weight Capacity", "value": "120 kg / 265 lbs"},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Product Dimensions',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 16.h),
        Column(
          children: List.generate(
            dimensions.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomPrimaryText(
                      text: dimensions[index]["title"]!,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.lightTextColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomPrimaryText(
                      text: dimensions[index]["value"]!,
                      textAlign: TextAlign.right,
                      fontSize: 16.sp,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.buttonTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
