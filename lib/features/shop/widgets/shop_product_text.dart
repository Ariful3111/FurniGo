import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ShopProductText extends StatelessWidget {
  final List<Color> color;
  final String title;
  final String price;

  const ShopProductText({
    super.key,
    required this.color,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: title,
              fontSize: 12.sp,
              color: isDark
                  ? AppColors.darkPrimaryTextColor
                  : Color(0xFF585858),
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: SizedBox(
                height: 14.h,
                child: Stack(
                  children: List.generate(color.length, (index) {
                    return Positioned(
                      left: index * 10.w,
                      child: Container(
                        height: 12.w,
                        width: 12.w,
                        decoration: BoxDecoration(
                          color: color[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        child: (color.length > 3 && index == 2)
                            ? Center(
                                child: CustomPrimaryText(
                                  text: "+${color.length - 2}",
                                  fontSize: 6.sp,
                                  color: AppColors.whiteColor,
                                ),
                              )
                            : (index == color.length - 1 && color.length <= 3)
                            ? Center(
                                child: Image.asset(
                                  IconsPath.add,
                                  height: 7.h,
                                  width: 7.w,
                                  color: AppColors.whiteColor,
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        CustomPrimaryText(
          text: price,
          fontSize: 12.sp,
          color: isDark ? Color(0xFF989898) : AppColors.buttonTextColor,
        ),
      ],
    );
  }
}
