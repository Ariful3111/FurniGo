import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CustomTableFilter extends StatelessWidget {
  final ValueChanged<int> onTap;
  final List<String> item;
  final int selectedIndex;
  const CustomTableFilter({
    super.key,
    required this.onTap,
    required this.item,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      padding: EdgeInsets.all(8.r),
      radius: 12.r,
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          itemCount: item.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? isDark
                            ? AppColors.whiteColor
                            : AppColors.secondaryColor
                      : null,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: CustomPrimaryText(
                    text: item[index],
                    color: isSelected
                        ? isDark
                              ? AppColors.darkColor
                              : Color(0xFFE2E2E2)
                        : isDark
                        ? AppColors.whiteColor
                        : AppColors.darkColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
