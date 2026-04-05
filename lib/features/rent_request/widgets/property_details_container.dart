import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PropertyDetailsContainer extends StatelessWidget {
  final bool isChecked;
  final ValueChanged onChange;
  final String title;
  final VoidCallback onClose;
  final String? subTitle;
  final VoidCallback onAdd;
  final VoidCallback onRemoved;
  final String count;
  final bool readOnly;
  const PropertyDetailsContainer({
    super.key,
    required this.isChecked,
    required this.onChange,
    required this.title,
    required this.onAdd,
    required this.onRemoved,
    required this.count,
    required this.readOnly,
    this.subTitle,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(12.r),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkColor : AppColors.whiteColor,
        border: Border.all(width: 1.r, color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 12,
            color: AppColors.shadowColor.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCheckBox(
                isChecked: isChecked,
                onChange: onChange,
                color: Color(0xFF00C0E8),
              ),
              CustomPrimaryText(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.whiteColor : AppColors.darkColor,
              ),
              Spacer(),
              InkWell(
                onTap: onClose,
                child: Image.asset(IconsPath.close, height: 20.h, width: 20.w),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 32.w),
              CustomPrimaryText(
                text: subTitle ?? 'Count',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.whiteColor : AppColors.darkColor,
              ),
              Spacer(),
              button(
                onTap: isChecked ? onRemoved : () {},
                child: Icon(
                  Icons.remove,
                  size: 12.r,
                  color: isChecked
                      ? isDark
                            ? AppColors.whiteColor
                            : AppColors.darkColor
                      : Color(0xFFC0C0C0),
                ),
                isDark: isDark,
              ),
              SizedBox(width: 2.w),
              button(
                onTap: () {},
                child: CustomPrimaryText(
                  text: count,
                  fontSize: 10.sp,
                  color: isChecked
                      ? isDark
                            ? AppColors.whiteColor
                            : AppColors.buttonTextColor
                      : Color(0xFFC0C0C0),
                ),
                isDark: isDark,
              ),
              SizedBox(width: 2.w),
              button(
                onTap: isChecked ? onAdd : () {},
                child: Icon(
                  Icons.add,
                  size: 12.r,
                  color: isChecked
                      ? isDark
                            ? AppColors.whiteColor
                            : AppColors.darkColor
                      : Color(0xFFC0C0C0),
                ),

                isDark: isDark,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    required Widget child,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 20.h,
        width: 22.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.labelColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(3.5.r),
          border: Border.all(
            width: 0.44.r,
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.fieldBorderColor,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
