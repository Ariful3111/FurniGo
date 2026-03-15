import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsQuoteItemDetailsInfo extends StatelessWidget {
  const RentalsQuoteItemDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    List info = [
      {'label': 'Width', 'value': 'H84.5 x W64 x D75 cm'},
      {'label': 'Width', 'value': 'H84.5 x W64 x D75 cm'},
      {'label': 'Width', 'value': 'H84.5 x W64 x D75 cm'},
      {'label': 'Width', 'value': 'H84.5 x W64 x D75 cm'},
    ];
    List details = [
      'Soft velvet upholstery with a luxurious finish',
      'Soft velvet upholstery with a luxurious finish',
      'Soft velvet upholstery with a luxurious finish',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Product Details',
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 12.h),
        ...List.generate(info.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPrimaryText(
                  text: info[index]['label'],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppColors.whiteColor : Color(0xFF737373),
                ),
                CustomPrimaryText(
                  text: info[index]['value'],
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.buttonTextColor,
                ),
              ],
            ),
          );
        }),
        CustomPrimaryText(
          text: 'Why it works for rentals',
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : Color(0xFF212121),
        ),
        SizedBox(height: 14.h),
        ...List.generate(details.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: details.length - 1 == index ? 0 : 4.h,
              left: 16.w,
            ),
            child: CustomPrimaryText(
              text: details[index],
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.whiteColor : Color(0xFF737373),
            ),
          );
        }),
      ],
    );
  }
}
