import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentItemDialogHeader extends StatelessWidget {
  final String title;
  final String itemCount;
  const RentItemDialogHeader({
    super.key,
    required this.title,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: title,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.whiteColor
                  : AppColors.fieldTextColorDark,
            ),
            CustomPrimaryText(
              text: 'Item Summary',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.whiteColor
                  : AppColors.fieldTextColorDark,
            ),
          ],
        ),
        CustomPrimaryText(
          text: '$itemCount items',
          fontSize: 12.sp,
          color: isDark ? AppColors.primaryBorderColor : Color(0xFF696969),
        ),
      ],
    );
  }
}
