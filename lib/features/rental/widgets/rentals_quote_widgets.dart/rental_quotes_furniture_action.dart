import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';

class RentalQuotesFurnitureAction extends StatelessWidget {
  final int index;
  final String category;

  const RentalQuotesFurnitureAction({
    super.key,
    required this.index,
    this.category = 'furniture',
  });

  @override
  Widget build(BuildContext context) {
    RentalQuotesController quotesController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final actions = category == 'furniture'
          ? quotesController.furnitureActions
          : quotesController.applianceActions;

      final action = index < actions.length
          ? actions[index]
          : QuoteItemAction.none;
      final isApproved = action == QuoteItemAction.approved;
      final isChange = action == QuoteItemAction.change;
      final isClose = action == QuoteItemAction.closed;

      return Row(
        children: [
          button(
            onTap: () {
              quotesController.toggleItemAction(
                index,
                QuoteItemAction.approved,
                category: category,
              );
            },
            borderColor: AppColors.successColor,
            icon: IconsPath.approved,
            color: isApproved ? AppColors.successColor : null,
            iconColor: isApproved ? AppColors.whiteColor : null,
          ),
          SizedBox(width: 6.4.w),
          button(
            onTap: () {
              quotesController.toggleItemAction(
                index,
                QuoteItemAction.change,
                category: category,
              );
            },
            borderColor: isDark ? AppColors.whiteColor : AppColors.primaryColor,
            icon: IconsPath.reset,
            color: isChange
                ? isDark
                      ? AppColors.whiteColor
                      : AppColors.primaryColor
                : null,
            iconColor: isChange
                ? isDark
                      ? null
                      : AppColors.whiteColor
                : isDark
                ? AppColors.whiteColor
                : null,
          ),
          SizedBox(width: 6.4.w),
          button(
            onTap: () {
              quotesController.toggleItemAction(
                index,
                QuoteItemAction.closed,
                category: category,
              );
            },
            borderColor:  Color(0xFFDF1C41),
            icon: IconsPath.close,
            color: isClose ? const Color(0xFFDF1C41) : null,
            iconColor: isClose ? AppColors.whiteColor : null,
          ),
        ],
      );
    });
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
