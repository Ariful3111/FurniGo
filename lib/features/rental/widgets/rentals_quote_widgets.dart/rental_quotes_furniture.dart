import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture_action.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalQuotesFurniture extends StatelessWidget {
  const RentalQuotesFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(3, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(title: 'Item', isDark: isDark),
            SizedBox(height: 12.h),
            Row(
              children: [
                Image.asset(IconsPath.furniture, height: 48.h, width: 48.w),
                SizedBox(width: 19.w),
                text(title: 'Refrigerator', isDark: isDark),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                row(data: '01', isDark: isDark),
                row(data: '\$20', isDark: isDark),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                text(title: 'Action:', isDark: isDark),
                SizedBox(width: 8.w),
                RentalQuotesFurnitureAction(),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget text({required String title, required bool isDark}) {
    return CustomPrimaryText(
      text: title,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    );
  }

  Widget row({required String data, required bool isDark}) {
    return Expanded(
      child: Row(
        children: [
          text(title: 'Qty:', isDark: isDark),
          SizedBox(width: 16.w),
          text(title: data, isDark: isDark),
        ],
      ),
    );
  }

  
}
