import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/widgets/order_widgets/order_button.dart';
import 'package:zb_dezign/features/dashboard/widgets/order_widgets/order_info.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderDetailsInfo extends StatelessWidget {
  const OrderDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderInfo(),
          SizedBox(height: 12.h),
          OrderButton(),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 20.h),
          CustomPrimaryText(
            text: 'Order Items',
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 16.h),
          ...List.generate(2, (index) {
            return SharedContainer(
              margin: EdgeInsets.only(bottom: index==1?0:12.h),
              color: isDark?AppColors.darkColor:Color(0xFFF3F3F3),
              radius: 16.r,
              padding: EdgeInsets.all(12.r),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(6.r),
                    child: Image.asset(
                      IconsPath.furniture,
                      height: 48.h,
                      width: 48.w,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: 'Modern Leather Sofa',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.lightGreyColor,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          text(text: 'Sofa', isDark: isDark),
                          SizedBox(width: 11.w),
                          divider(isDark: isDark),
                          SizedBox(width: 11.w),
                          text(text: 'Color: Brown', isDark: isDark),
                          SizedBox(width: 11.w),
                          divider(isDark: isDark),
                          SizedBox(width: 11.w),
                          text(text: 'Quantity: 01', isDark: isDark),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      CustomPrimaryText(
                        text: '\$32.00',
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.buttonTextColor,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget text({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: isDark ? AppColors.darkPrimaryTextColor : Color(0xFF737373),
    );
  }

  Widget divider({required bool isDark}) {
    return Container(
      height: 13.h,
      width: 1.w,
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF697483) : Color(0xFF737373),
      ),
    );
  }
}
