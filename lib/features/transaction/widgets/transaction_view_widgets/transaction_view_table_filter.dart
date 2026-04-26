import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_controller.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_calender.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class TransactionViewTableFilter extends GetWidget<TransactionController> {
  const TransactionViewTableFilter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        CustomDialogAnimation().showAnimatedDialog(
          context: context,
          dialog: TransactionCalender(),
          isDark: isDark,
        );
      },
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: SharedContainer(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              border: Border.all(
                width: 1.r,
                color: isDark
                    ? AppColors.darkBorderColor
                    : AppColors.fieldBorderColorLight,
              ),
              radius: 16.r,
              child: Row(
                children: [
                  Image.asset(
                    IconsPath.calender,
                    height: 16.h,
                    width: 16.w,
                    color: isDark ? AppColors.whiteColor : null,
                  ),
                  SizedBox(width: 10.w),
                  text(text: '04/09/2025', isDark: isDark),
                  SizedBox(width: 6.w),
                  arrowButton(onTap: () {}, isDark: isDark),
                  SizedBox(width: 12.w),
                  Container(
                    width: 8.w,
                    height: 1.h,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkPrimaryTextColor
                          : AppColors.darkSecondaryTextColor,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  text(text: '04/09/2025', isDark: isDark),
                  SizedBox(width: 6.w),
                  arrowButton(onTap: () {}, isDark: isDark),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            flex: 2,
            child: CustomTextFormField(
              controller: controller.searchController,
              labelText: 'Search',
              padding: EdgeInsets.all(4.r),
              labelColor: Color(0xFF9F9F9F),
              labelFontSize: 12.sp,
              labelFontWeight: FontWeight.w400,
              suffixIcon: Padding(
                padding: EdgeInsetsGeometry.only(right: 16.w),
                child: Image.asset(IconsPath.search, height: 16.h, width: 16.w),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget text({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: isDark
          ? AppColors.darkPrimaryTextColor
          : AppColors.darkSecondaryTextColor,
    );
  }

  Widget arrowButton({required VoidCallback onTap, required bool isDark}) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        IconsPath.downArrow,
        height: 12.h,
        width: 12.w,
        color: isDark
            ? AppColors.darkPrimaryTextColor
            : AppColors.darkSecondaryTextColor,
      ),
    );
  }
}
