import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/shared/extensions/formatters/date_formatter.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OrderInfo extends StatelessWidget {
  final OrderData order;
  const OrderInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        row(
          isDark: isDark,
          sub1: 'Order Placed',
          sub2: 'Order ID',
          title1: order.createdAt?.toFormattedDate() ?? '-',
          title2: order.id.toString(),
        ),
        SizedBox(height: 16.h),
        row(
          isDark: isDark,
          sub1: 'Order Status',
          sub2: 'Total Amount',
          title1: order.status.toString(),
          title2: '\$${order.grandTotal.toString()}',
        ),
      ],
    );
  }

  Widget row({
    required bool isDark,
    required String sub1,
    required String sub2,
    required String title1,
    required String title2,
  }) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPrimaryText(
                  text: sub1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.darkPrimaryTextColor
                      : AppColors.greyColor,
                  maxLine: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: title1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.whiteColor : AppColors.titleColor,
                  maxLine: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          Container(
            height: 40.h,
            width: 1.w,
            decoration: BoxDecoration(
              color: isDark
                  ? Color(0xFF697483)
                  : AppColors.fieldBorderColorLight,
              border: Border.all(
                width: 1.r,
                color: isDark
                    ? Color(0xFF697483)
                    : AppColors.fieldBorderColorLight,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPrimaryText(
                  text: sub2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.darkPrimaryTextColor
                      : AppColors.greyColor,
                  maxLine: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: title2,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.whiteColor : AppColors.titleColor,
                  maxLine: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
