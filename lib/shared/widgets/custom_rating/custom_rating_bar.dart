import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;
  final String? image;
  final double? itemSize;
  final Color? ratingColor;
  const CustomRatingBar({
    super.key,
    required this.rating,
    this.image,
    this.itemSize, this.ratingColor,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemCount: 5,
      itemSize: itemSize ?? 20.sp,
      itemPadding: EdgeInsets.all(2.r),
      unratedColor: AppColors.fieldBorderColor,
      itemBuilder: (_, _) {
        return Image.asset(image ?? IconsPath.rating, color: ratingColor);
      },
    );
  }
}