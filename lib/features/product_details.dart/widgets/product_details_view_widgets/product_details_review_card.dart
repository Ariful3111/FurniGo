import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductDetailsReviewCard extends StatelessWidget {
  final String name;
  final String time;
  final double rating;
  final String image;
  final String review;
  final bool isDark;

  const ProductDetailsReviewCard({
    super.key,
    required this.name,
    required this.time,
    required this.rating,
    required this.image,
    required this.review,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return SharedContainer(
      padding: EdgeInsets.all(16.w),
      radius: 15.r,
      border: Border.all(
        color: isDark ? AppColors.darkBorderColor : AppColors.buttonBorderColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomPrimaryText(
                          text: name,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.darkTextColor,
                        ),
                        SizedBox(width: 8.w),
                        Image.asset(
                          IconsPath.verify,
                          height: 15.h,
                          width: 15.w,
                          color: isDark ? null : AppColors.secondaryColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text: time,
                      fontSize: 12.sp,
                      color:isDark? AppColors.darkPrimaryTextColor:Color(0xFF64748B),
                    ),
                  ],
                ),
              ),
              Icon(Icons.star, size: 18.sp, color: Color(0xFFECB900)),
              SizedBox(width: 4.w),
              CustomPrimaryText(
                text: rating.toString(),
                fontSize: 14.sp,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: review,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
        ],
      ),
    );
  }
}
