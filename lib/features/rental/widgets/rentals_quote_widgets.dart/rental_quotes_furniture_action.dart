import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';

class RentalQuotesFurnitureAction extends GetWidget<RentalQuotesController> {
  final int index;
  final bool isAppliance;
  final QuoteItemAction action;

  const RentalQuotesFurnitureAction({
    super.key,
    required this.index,
    required this.isAppliance,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final isApproved = action == QuoteItemAction.approved;
    final isChange = action == QuoteItemAction.change;
    final isClose = action == QuoteItemAction.closed;

    return Row(
      children: [
        button(
          onTap: () {
            controller.toggleItemAction(index, isAppliance);
          },
          borderColor: AppColors.acceptButtonColor,
          icon: IconsPath.approved,
          color: isApproved ? AppColors.acceptButtonColor : null,
          iconColor: isApproved ? AppColors.whiteColor : null,
        ),
        SizedBox(width: 6.4.w),
        button(
          onTap: () {
            controller.toggleItemAction(index, isAppliance);
          },
          borderColor: AppColors.reviseTextColor,
          icon: IconsPath.revision,
          color: isChange ? AppColors.reviseTextColor : null,
          iconColor: isChange ? AppColors.whiteColor : null,
        ),
        SizedBox(width: 6.4.w),
        button(
          onTap: () {
            controller.toggleItemAction(index, isAppliance);
          },
          borderColor: AppColors.rejectedTextColor,
          icon: IconsPath.close,
          color: isClose ? AppColors.rejectedTextColor : null,
          iconColor: isClose ? AppColors.whiteColor : null,
        ),
      ],
    );
  }

  Widget button({
    required Function() onTap,
    required String icon,
    Color? color,
    Color? borderColor,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: borderColor ?? AppColors.primaryBorderColor,
            width: 1.r,
          ),
        ),
        child: Image.asset(icon, color: iconColor, height: 12.h, width: 12.w),
      ),
    );
  }
}
