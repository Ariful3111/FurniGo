import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_rating/custom_rating_bar.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsRatingInfo extends StatelessWidget {
  const ProductDetailsRatingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        _ratingSummary(isDark),
        SizedBox(width: 16.w),
        _divider(isDark),
        SizedBox(width: 16.w),
        _ratingDetails(isDark),
      ],
    );
  }

  Widget _ratingSummary(bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomPrimaryText(
          text: "4.5",
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(width: 4.w),
        CustomPrimaryText(
          text: "/5",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : Color(0xFF212121),
        ),
      ],
    );
  }

  Widget _divider(bool isDark) {
    return Container(
      width: 1,
      height: 40.h,
      color: isDark ? AppColors.darkBorderColor : AppColors.buttonBorderColor,
    );
  }

  Widget _ratingDetails(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRatingBar(rating: 4.5),
        SizedBox(height: 6.h),
        Row(
          children: [
            CustomPrimaryText(
              text: "4.5",
              fontSize: 14.sp,
              color:isDark?AppColors.primaryBorderColor: Color(0xFF585858),
            ),
            SizedBox(width: 6.w),
            Container(
              width: 4.w,
              height: 4.w,
              decoration: BoxDecoration(
                color:isDark?AppColors.primaryBorderColor: Color(0xFF585858),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 6.w),
            CustomPrimaryText(
              text: "5.2 Rating",
              fontSize: 14.sp,
             color:isDark?AppColors.primaryBorderColor: Color(0xFF585858),
            ),
          ],
        ),
      ],
    );
  }
}
