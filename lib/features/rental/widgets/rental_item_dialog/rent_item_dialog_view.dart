import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rent_item_dialog_list.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentItemDialogView extends StatelessWidget {
  const RentItemDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalQuotesController controller = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final height = MediaQuery.heightOf(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        width: 320.w,
        height: height * 0.85,
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1.r,
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.buttonBorderColor,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkColor.withValues(alpha: 0.25),
              blurRadius: 30,
              offset: Offset(-4, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: 'Furniture',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.fieldTextColorDark,
                    ),
                    CustomPrimaryText(
                      text: 'Item Summary',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.fieldTextColorDark,
                    ),
                  ],
                ),
                Obx(() {
                  return CustomPrimaryText(
                    text:
                        '${controller.approvedItems.length + controller.revisedItems.length} items',
                    fontSize: 12.sp,
                    color: isDark ? AppColors.primaryBorderColor : Color(0xFF696969),
                  );
                }),
              ],
            ),
            RentItemDialogList(),
            Divider(height: 1, color: isDark ? Colors.white12 : Colors.black12),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Obx(() {
                return Column(
                  children: [
                    _buildSummaryRow(
                      'Subtotal',
                      '\$${controller.subtotal.toStringAsFixed(2)}',
                      isDark,
                    ),
                    SizedBox(height: 8.h),
                    _buildSummaryRow(
                      'Discount (3%)',
                      '-\$${controller.totalDiscount.toStringAsFixed(2)}',
                      isDark,
                    ),
                    SizedBox(height: 8.h),
                    _buildSummaryRow(
                      'Setup Charge',
                      '\$${controller.totalCharge.toStringAsFixed(2)}',
                      isDark,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPrimaryText(
                          text: 'Total',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                        CustomPrimaryText(
                          text: '\$${controller.grandTotal.toStringAsFixed(2)}',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.back(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E0B5D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                            ),
                            child: Text(
                              'Request Revision',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.back(),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red.shade200),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                            ),
                            child: Text(
                              'Decline',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: label,
          fontSize: 12.sp,
          color: isDark ? Colors.white70 : Colors.black54,
        ),
        CustomPrimaryText(
          text: value,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ],
    );
  }

 
}
