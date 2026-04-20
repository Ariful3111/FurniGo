import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class NotificationListInfo extends StatelessWidget {
  final int index;
  final List notification;
  const NotificationListInfo({
    super.key,
    required this.index,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final item = notification[index];
    return Row(
      children: [
        SharedContainer(
          radius: 100.r,
          height: 48.h,
          width: 48.h,
          padding: EdgeInsets.zero,
          color: notification.length - 1 == index
              ?isDark? Color(0xFFFF383C):Color(0xFFFAE8E7)
              :isDark? Color(0xFF0E5843): AppColors.darkActiveTextColor,
          child: Center(
            child: Image.asset(
              IconsPath.bell,
              height: 16.h,
              width: 16.w,
              color: notification.length - 1 == index
                  ?isDark? AppColors.whiteColor: Color(0xFFFF383C)
                  :isDark? AppColors.whiteColor:null,
            ),
          ),
        ),
        SizedBox(width: 18.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomPrimaryText(
                      text: item['title'],
                      fontSize: 16.sp,
                      color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomPrimaryText(
                    text: item['time'],
                    fontSize: 12.sp,
                    color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text: item['sub'],
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.darkPrimaryTextColor
                    : AppColors.primaryGreyTextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
