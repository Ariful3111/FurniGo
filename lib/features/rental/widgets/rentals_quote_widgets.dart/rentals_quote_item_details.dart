import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rentals_quote_item_details_info.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rentals_quote_item_details_preview.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsQuoteItemDetails extends GetWidget<RentalQuotesController> {
  final int index;
  final Map<String, dynamic> item;
  const RentalsQuoteItemDetails({
    super.key,
    required this.item,
    required this.index,
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
          Stack(
            children: [
              Container(
                height: 264.h,
                width: MediaQuery.widthOf(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image: AssetImage(item['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 12.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNavButton(Icons.chevron_left, isDark),
                    SizedBox(width: 7.66.w),
                    _buildNavButton(Icons.chevron_right, isDark),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 22.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPrimaryText(text: item['name'], fontSize: 22.sp),
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.isShowInfo.value = !controller.isShowInfo.value;
                  },
                  child: AnimatedRotation(
                    turns: controller.isShowInfo.value ? 1 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset(
                      controller.isShowInfo.value
                          ? IconsPath.upArrow
                          : IconsPath.downArrow,
                      height: 20.h,
                      width: 20.w,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 22.h),
          Obx(
            () => AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
              child: controller.isShowInfo.value
                  ? RentalsQuoteItemDetailsInfo(key: ValueKey('info'))
                  : SizedBox(key: ValueKey('empty')),
            ),
          ),
          RentalsQuoteItemDetailsPreview(index: index),
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
            color: AppColors.darkGreyColor.withValues(alpha: 0.12),
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
