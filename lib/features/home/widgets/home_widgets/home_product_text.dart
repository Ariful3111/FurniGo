import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeProductText extends StatelessWidget {
  final List color;
  final String title;
  final String price;
  const HomeProductText({super.key, required this.color, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomPrimaryText(
                text: title,
                fontSize: 12.sp,
                color: isDark
                    ? AppColors.darkPrimaryTextColor
                    : Color(0xFF585858),
              ),
              SizedBox(width: 40.w),
              SizedBox(
                width: 55.w,
                height: 12.h,
                child: Stack(
                  children: List.generate(color.length, (index) {
                    return Positioned(
                      left: index * 9.w,
                      child: Container(
                        height: 11.85.h,
                        width: 11.85.w,
                        decoration: BoxDecoration(
                          color: color[index],
                          border: Border.all(
                            width: 0.49.r,
                            color: AppColors.whiteColor,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: color.length - 1 == index
                            ? Center(
                                child: Image.asset(
                                  IconsPath.add,
                                  height: 7.9.h,
                                  width: 7.9.w,
                                  color: AppColors.whiteColor,
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          CustomPrimaryText(
            text: price,
            fontSize: 12.sp,
            color: isDark ? Color(0xFF989898) : AppColors.buttonTextColor,
          ),
        ],
      ),
    );
  }
}
