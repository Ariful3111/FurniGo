import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class CustomAddPaymentDialogCard extends StatelessWidget {
  
  const CustomAddPaymentDialogCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> brands = [
    IconsPath.visa,
    IconsPath.masterCard,
    IconsPath.visa,
    IconsPath.visa,
  ];

    return Row(
      children: List.generate(
        brands.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Container(
            width: 34.w,
            height: 24.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              image: DecorationImage(
                image: AssetImage(brands[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}