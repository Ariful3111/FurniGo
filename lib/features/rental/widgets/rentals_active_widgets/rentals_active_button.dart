import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';

class RentalsActiveButton extends StatelessWidget {
  const RentalsActiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomPrimaryButton(
            height: 40.h,
            backgroundColor: AppColors.whiteColor,
            border: Border.all(width: 1.r,color: AppColors.buttonBorderColor),
            fontSize: 12.sp,
            textColor: AppColors.labelColor,
            text: 'Raise a ticket', onPressed: () {}),
        ),
        SizedBox(width: 8.w,),
        Expanded(
          child: CustomPrimaryButton(text: 'Manage Support', 
          height: 40.h,
          fontSize: 12.sp,
          onPressed: () {}),
        ),
      ],
    );
  }
}
