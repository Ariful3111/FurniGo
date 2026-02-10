import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PropertyAddButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const PropertyAddButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:55.h,
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(width: 1.r, color: Color(0xFF4C4C4C)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconsPath.propertyAdd,height: 20.h,width: 20.w,),
            SizedBox(width: 8.w,),
            CustomPrimaryText(text: text,fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.labelColor,)
          ],
        ),
      ),
    );
  }
}