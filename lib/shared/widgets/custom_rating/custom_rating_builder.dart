import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class CustomRatingBuilder extends StatelessWidget {
  final double rating;
  final int? itemCount;
  final ValueChanged<double> onRatingUpdate;
  final bool? allowHalfRating;
  const CustomRatingBuilder({
    super.key,
    required this.rating,
    this.itemCount,
    required this.onRatingUpdate,
    this.allowHalfRating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemBuilder: (context, index) {
        return Image.asset(IconsPath.rating);
      },
      onRatingUpdate: onRatingUpdate,
      initialRating: rating,
      itemCount: itemCount ?? 5,
      itemSize: 24.r,
      itemPadding: EdgeInsetsGeometry.only(right: 12.w),
      allowHalfRating: allowHalfRating ?? true,
      
    );
  }
}
