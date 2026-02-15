import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentReviewModel extends StatelessWidget {
  final String title;
  final List data;
  const RentReviewModel({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.darkTextColor,
        ),
        SizedBox(height: 18.h),
        ...List.generate(data.length, (index) {
          final item = data[index];
          return Padding(
            padding: EdgeInsets.only(bottom:data.length-1 == index ? 0 : 12.0.h),
            child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomPrimaryText(
                      text: item['title'],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkTextColor,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomPrimaryText(
                      text:':',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkTextColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CustomPrimaryText(
                      text: item['value'],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkTextColor,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                
              ],
            ),
          );
        }),
      if(title!='Delivery Details') SizedBox(height: 20.h),
      if(title!='Delivery Details')  propertyDivider()
      ],
    );
  }
}
