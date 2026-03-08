import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_new_arrival_design.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeNewArrival extends StatelessWidget {
  const HomeNewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Color(0xFFBCBAC9),
      Color(0xFFDEC4AF),
      Color(0xFFD28E8D),
      Color(0xFF86765B),
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeNewArrivalDesign(),
                SizedBox(height: 14.h),
                Expanded(
                  child: Row(
                    children: [
                      CustomPrimaryText(
                        text: 'Modern Velvet Sofa',
                        fontSize: 12.sp,
                        color: isDark
                            ? AppColors.darkPrimaryTextColor
                            : Color(0xFF585858),
                      ),
                      SizedBox(width: 40.w,),
                      SizedBox(
                        width: 55.w,
                        height: 12.h,
                        child: Stack(children: List.generate(color.length, (index) {
                          return Positioned(
                            left: index*9.w,
                            child: Container(
                              height: 11.85.h,
                              width: 11.85.w,
                              decoration: BoxDecoration(
                                color: color[index],
                                border: Border.all(width: 0.49.r,color: AppColors.whiteColor),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: color.length-1==index?Center(child: Image.asset(IconsPath.add,height: 7.9.h,width: 7.9.w,color: AppColors.whiteColor,),):SizedBox.shrink(),
                            ),
                          );
                        }),),
                      ),
                    ],
                  ),
                ),
                CustomPrimaryText(
                  text: '\$299.00',
                  fontSize: 12.sp,
                  color: isDark ? Color(0xFF989898) : AppColors.buttonTextColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
