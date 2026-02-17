import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableHeader extends StatelessWidget {
  final List<String> headerList;
  const CustomTableHeader({super.key, required this.headerList});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(headerList.length, (i) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 40.h,
              child: Center(
                child: CustomPrimaryText(
                  text: headerList[i],
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.greyColor,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
