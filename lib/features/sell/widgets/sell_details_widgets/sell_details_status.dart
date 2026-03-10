import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell/controller/sell_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellDetailsStatus extends StatelessWidget {
  const SellDetailsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SellDetailsController sellDetailsController = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Status',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 18.h),
          ...List.generate(sellDetailsController.status.length, (index) {
            final item = sellDetailsController.status[index];
            final isStatus = item['status'] == true;
            return SizedBox(
              height: 85.h,
              child: TimelineTile(
                indicatorStyle: IndicatorStyle(
                  height: 40.h,
                  width: 40.w,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  indicator: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isStatus
                          ? Color(0xFF21D19F)
                          : AppColors.primaryColor,
                    ),
                    child: Center(
                      child: isStatus
                          ? Image.asset(
                              IconsPath.mark,
                              height: 24.h,
                              width: 24.w,
                              color: AppColors.whiteColor,
                            )
                          : CustomPrimaryText(
                              text: '${index + 1}',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                    ),
                  ),
                  indicatorXY: 0.0,
                ),
                beforeLineStyle: LineStyle(
                  color: isStatus ? Color(0xFF21D19F) : Color(0xFFCDCDCD),
                  thickness: 2.w,
                ),
                isFirst: index == 0 ? true : false,
                isLast: sellDetailsController.status.length - 1 == index
                    ? true
                    : false,
                endChild: Padding(
                  padding: EdgeInsets.only(left: 12.w,top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: item['title'],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.titleColor,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: isStatus ? 'Dec 10, 2024' : 'Pending',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.primaryBorderColor
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          CustomDivider()
        ],
      ),
    );
  }
}
