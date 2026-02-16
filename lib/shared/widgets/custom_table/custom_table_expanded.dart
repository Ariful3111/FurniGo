import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomTableExpanded extends StatelessWidget {
  final String id;
  final String title;
  final VoidCallback onTap;
  final Widget expandedElements;
  const CustomTableExpanded({
    super.key,
    required this.id,
    required this.onTap,
    required this.title, required this.expandedElements,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDetailRow(title, id, isBold: true),
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 36.h,
                  width: 36.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryBorderColor
                  ),
                  child: Icon(
                    Icons.close,
                    size: 20.sp,
                    color: Color(0xFF251621),
                  ),
                ),
              ),
            ],
          ),
          expandedElements
        ],
      ),
    );
  }
}

 Widget buildDetailRow(String label, String value, {bool isBold = false}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$label : '.toUpperCase(),
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor,
          ),
        ),
        TextSpan(
          text: value,
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: isBold ? AppColors.darkTextColor : AppColors.greyColor,
          ),
        ),
      ],
    ),
  );
}
