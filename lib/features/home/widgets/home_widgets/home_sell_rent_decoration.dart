import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class HomeSellRentDecoration extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final String title;
  final String sub;
  final String image;
  final String buttonTitle;
  final VoidCallback onTap;
  final double buttonWidth;
  final TextAlign? titleTextAlign;
  final TextAlign? subTextAlign;
  const HomeSellRentDecoration({
    super.key,
    required this.crossAxisAlignment,
    required this.title,
    required this.sub,
    required this.buttonTitle,
    required this.onTap,
    required this.buttonWidth, this.titleTextAlign, this.subTextAlign, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
    color: isDark?AppColors.darkColor:AppColors.whiteColor,
    border: Border.all(width: 4.r,color:isDark? AppColors.greyTextColor:AppColors.whiteColor),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 8),
          blurRadius: 28,
          color: AppColors.shadowColor.withValues(alpha: 0.1),
        ),
      ],
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
      height: 260.h,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomPrimaryText(
            text: title.toUpperCase(),
            textAlign: titleTextAlign,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
            shadow: [boxShadow()],
          ),
          SizedBox(height: 4.h),
          CustomPrimaryText(
            text: sub,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryBorderColor,
            textAlign: subTextAlign,
            shadow: [boxShadow()],
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              width: buttonWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.r),
                border: Border.all(width: 1.r, color: AppColors.whiteColor),
              ),
              child: Row(
                children: [
                  CustomPrimaryText(
                    text: buttonTitle,
                    fontSize: 12.sp,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.whiteColor,
                    size: 16.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxShadow boxShadow() {
    return BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 4,
      color: AppColors.shadowColor.withValues(alpha: 0.25),
    );
  }
}
