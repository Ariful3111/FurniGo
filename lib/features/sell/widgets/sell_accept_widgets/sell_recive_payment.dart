import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellRecivePayment extends StatelessWidget {
  const SellRecivePayment({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          children: [
            text(text: 'Account Information', isDark: isDark),
            Spacer(),
            Image.asset(IconsPath.visa, height: 20.h, width: 32.w),
            SizedBox(width: 12.w,),
            text(text: '45531213', isDark: isDark,fontWeight: FontWeight.w400),
          ],
        ),
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text(text: 'Date', isDark: isDark),
            text(text: '12/8/26', isDark: isDark,fontWeight: FontWeight.w400)
          ],
        )
      ],
    );
  }
  Widget text({
    required String text,
    required bool isDark,
    FontWeight? fontWeight,
  }) {
    return CustomPrimaryText(
      text: text,
      fontSize: 14.sp,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
      fontWeight: fontWeight,
    );
  }
}
