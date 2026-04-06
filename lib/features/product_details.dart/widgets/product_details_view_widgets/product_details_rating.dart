import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_info.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_percent.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsRating extends StatelessWidget {
  const ProductDetailsRating({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ratings = [
      {"star": 5, "value": 0.9},
      {"star": 4, "value": 0.75},
      {"star": 3, "value": 0.55},
      {"star": 2, "value": 0.3},
      {"star": 1, "value": 0.15},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPrimaryText(
                text: "Rating & Reviews",
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
              CustomPrimaryText(
                text: "(18 New Reviews)",
                fontSize: 12.sp,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.darkSecondaryColor,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ProductDetailsRatingInfo(),
          SizedBox(height: 20.h),
          Divider(
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.buttonBorderColor,
          ),
          SizedBox(height: 20.h),
          Column(
            children: ratings
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ProductDetailsRatingPercent(
                      star: e["star"] as int,
                      percent: e["value"] as double,
                      isDark: isDark,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
