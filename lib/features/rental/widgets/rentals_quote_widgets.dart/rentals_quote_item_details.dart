import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rentals_quote_item_details_info.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rentals_quote_item_details_preview.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsQuoteItemDetails extends StatelessWidget {
  final int index;
  final Map<String, dynamic> item;
  const RentalsQuoteItemDetails({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RentalQuotesController quotesController = Get.find();
    return Container(
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkColor : AppColors.whiteColor,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  item['image'] ?? IconsPath.furniture,
                  height: 264.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
              CustomPrimaryText(
                text: item['name'] ?? 'Furniture',
                fontSize: 22.sp,
              ),
              Obx(
                () => InkWell(
                  onTap: () {
                    quotesController.isShowInfo.value =
                        !quotesController.isShowInfo.value;
                  },
                  child: AnimatedRotation(
                    turns: quotesController.isShowInfo.value ? 1 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset(
                      quotesController.isShowInfo.value
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
              child: quotesController.isShowInfo.value
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
