import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';

class RentalQuotesFurnitureAction extends StatelessWidget {
  const RentalQuotesFurnitureAction({super.key});

  @override
  Widget build(BuildContext context) {
    RentalQuotesController quotesController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Row(
        children: [
          button(
            onTap: () {
              quotesController.isApproved.value =
                  !quotesController.isApproved.value;
            },
            borderColor: AppColors.successColor,
            icon: IconsPath.approved,
            color: quotesController.isApproved.value
                ? AppColors.successColor
                : null,
          ),
          SizedBox(width: 6.4.w),
          button(
            onTap: () {
              quotesController.isReset.value = !quotesController.isReset.value;
            },
            borderColor: isDark ? AppColors.whiteColor : AppColors.primaryColor,
            icon: IconsPath.reset,
            color: quotesController.isReset.value
                ? isDark
                      ? AppColors.whiteColor
                      : AppColors.primaryColor
                : null,
          ),
          SizedBox(width: 6.4.w),
          button(
            onTap: () {
              quotesController.isClose.value = !quotesController.isClose.value;
            },
            borderColor: Color(0xFFDF1C41),
            icon: IconsPath.close,
            color: quotesController.isClose.value? Color(0xFFDF1C41):null,
          ),
        ],
      ),
    );
  }

  Widget button({
    required VoidCallback onTap,
    required Color borderColor,
    required String icon,
    Color? color,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 1.6.r, color: borderColor),
          borderRadius: BorderRadius.circular(43.2.r),
        ),
        child: Center(
          child: Image.asset(
            icon,
            height: 19.2.h,
            width: 19.2.w,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
