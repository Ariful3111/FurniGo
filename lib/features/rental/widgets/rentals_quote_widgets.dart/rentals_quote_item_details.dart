import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rentals_quote_item_details_info.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rentals_quote_item_details_preview.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsQuoteItemDetails extends GetWidget<RentalQuotesController> {
  final int index;
  final Map<String, dynamic> item;
  final bool isAppliance;

  const RentalsQuoteItemDetails({
    super.key,
    required this.item,
    required this.index,
    required this.isAppliance,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.labelColor : AppColors.whiteColor,
        border: Border.all(
          width: 1.r,
          color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPrimaryText(
                text: item['room'] ?? 'Unknown Room',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.toggleShowInfo(),
                    child: Obx(
                      () => _buildNavButton(
                        controller.isShowInfo.value
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        isDark,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () =>
                        controller.toggleItemExpanded(index, isAppliance),
                    child: _buildNavButton(Icons.close, isDark),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: '${item['items']?.length ?? 0} items',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.greyColor : AppColors.greyTextColor,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              CustomPrimaryText(
                text: 'Condition: ',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.greyColor : AppColors.greyTextColor,
              ),
              CustomPrimaryText(
                text: item['condition'] ?? 'Good',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
              SizedBox(width: 16.w),
              CustomPrimaryText(
                text: 'Style: ',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.greyColor : AppColors.greyTextColor,
              ),
              CustomPrimaryText(
                text: item['style'] ?? 'Modern',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Obx(
            () => AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
              child: controller.isShowInfo.value
                  ? RentalsQuoteItemDetailsInfo(key: ValueKey('info'))
                  : SizedBox(key: ValueKey('empty')),
            ),
          ),
          RentalsQuoteItemDetailsPreview(
            index: index,
            isAppliance: isAppliance,
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, bool isDark) {
    return Container(
      width: 35.84.w,
      height: 28.16.h,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.96.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF222222).withValues(alpha: 0.12),
            blurRadius: 15.36,
            offset: Offset(0, 5.12),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          size: 20.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
      ),
    );
  }
}
