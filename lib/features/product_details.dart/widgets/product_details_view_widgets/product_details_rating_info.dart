import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_rating/custom_rating_bar.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsRatingInfo extends StatelessWidget {
  final bool isDark;
  final double averageRating;
  final int totalReviews;

  const ProductDetailsRatingInfo({
    super.key,
    required this.isDark,
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ratingSummary(isDark: isDark, averageRating: averageRating),
        SizedBox(width: 16.w),
        _divider(isDark: isDark),
        SizedBox(width: 16.w),
        _ratingDetails(
          isDark: isDark,
          averageRating: averageRating,
          totalReviews: totalReviews,
        ),
      ],
    );
  }

  Widget _ratingSummary({required bool isDark, required double averageRating}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomPrimaryText(
          text: averageRating.toStringAsFixed(1),
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(width: 4.w),
        CustomPrimaryText(
          text: "/5",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkSecondaryColor,
        ),
      ],
    );
  }

  Widget _divider({required bool isDark}) {
    return Container(
      width: 1,
      height: 40.h,
      color: isDark ? AppColors.darkBorderColor : AppColors.buttonBorderColor,
    );
  }

  Widget _ratingDetails({
    required bool isDark,
    required double averageRating,
    required int totalReviews,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRatingBar(rating: averageRating),
        SizedBox(height: 6.h),
        Row(
          children: [
            CustomPrimaryText(
              text: averageRating.toStringAsFixed(1),
              fontSize: 14.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.darkGreyTextColor,
            ),
            SizedBox(width: 6.w),
            Container(
              width: 4.w,
              height: 4.w,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.darkGreyTextColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 6.w),
            CustomPrimaryText(
              text: "$totalReviews Reviews",
              fontSize: 14.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.darkGreyTextColor,
            ),
          ],
        ),
      ],
    );
  }
}
