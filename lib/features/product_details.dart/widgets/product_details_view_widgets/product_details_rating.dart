import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_info.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_percent.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsRating extends GetWidget<ProductDetailsController> {
  const ProductDetailsRating({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final productData = controller.productDetails.value!.data;
    final reviews = productData.reviews;
    final totalReviews = reviews.length;

    // Calculate rating distribution dynamically
    final Map<int, int> starCounts = {5: 0, 4: 0, 3: 0, 2: 0, 1: 0};

    for (var review in reviews) {
      final star = review.rating.round();
      if (star >= 1 && star <= 5) {
        starCounts[star] = (starCounts[star] ?? 0) + 1;
      }
    }

    // Convert counts to percentages
    final ratings = starCounts.entries.map((entry) {
      return {
        "star": entry.key,
        "value": totalReviews > 0 ? entry.value / totalReviews : 0.0,
        "count": entry.value,
      };
    }).toList();

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
                text: "($totalReviews Reviews)",
                fontSize: 12.sp,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : Color(0xFF212121),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ProductDetailsRatingInfo(
            isDark: isDark,
            averageRating: productData.averageRating.toDouble(),
            totalReviews: productData.totalReviews,
          ),
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
