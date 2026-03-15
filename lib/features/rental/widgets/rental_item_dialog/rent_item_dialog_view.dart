import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rent_item_dialog_calculation.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rent_item_dialog_list.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';

class RentItemDialogView extends StatelessWidget {
  const RentItemDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final height = MediaQuery.heightOf(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        width: MediaQuery.widthOf(context),
        height: height * 0.85,
        margin: EdgeInsets.only(left: 40.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1.r,
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.buttonBorderColor,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkColor.withValues(alpha: 0.25),
              blurRadius: 30,
              offset: Offset(-4, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            RentItemDialogList(),
            CustomDivider(
              color: isDark
                  ? AppColors.darkBorderColor
                  : AppColors.buttonBorderColor,
            ),
            RentItemDialogCalculation(),
          ],
        ),
      ),
    );
  }
}
