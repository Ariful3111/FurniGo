import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_business_identification_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PageCount extends StatelessWidget {
  final String text;
  const PageCount({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    RentBusinessIdentificationController controller = Get.find();
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Center(
            child: Text(
              controller.currentIndex.value.toString(),
              style: GoogleFonts.arimo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h,),
        CustomPrimaryText(text: text,fontSize: 12.sp,fontWeight: FontWeight.w600,)
      ],
    );
  }
}
