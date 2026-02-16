import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableHeader extends StatelessWidget {
  const CustomTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding:  EdgeInsets.all(12.r),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomPrimaryText(
                    text: 'RENTAL ID',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyColor,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: CustomPrimaryText(
                      text: 'STATUS',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomPrimaryText(
                      text: 'ACTION',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}