import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/shared/extensions/formatters/date_formatter.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_timeline/custom_payment_timeline.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderStatus extends StatelessWidget {
  final OrderData order;
  const OrderStatus({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      radius: 20.r,
      padding: EdgeInsets.all(16.r),
      color: isDark ? AppColors.darkColor : Color(0xFFF3F3F3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Status Updates',
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: isDark ? AppColors.whiteColor : AppColors.greyColor,
          ),
          SizedBox(height: 8.h),
          if (order.statusHistories?.isEmpty ?? true)
            CustomPrimaryText(
              text: 'No status updates available',
              fontSize: 12.sp,
              color: isDark
                  ? AppColors.darkPrimaryTextColor
                  : AppColors.greyColor,
            )
          else
            ...List.generate(order.statusHistories?.length ?? 0, (index) {
              final firstIndex = index == 0;
              final history = order.statusHistories![index];

              return SizedBox(
                height: 80.h,
                child: CustomPaymentTimeline(
                  isFirst: firstIndex ? true : false,
                  indicatorXY: 0.1,
                  endChild: Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPrimaryText(
                          text: history.statusName ?? 'Unknown Status',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: firstIndex
                              ? isDark
                                    ? AppColors.whiteColor
                                    : AppColors.darkTextColor
                              : isDark
                              ? AppColors.darkPrimaryTextColor
                              : Color(0xFF6A6A6A),
                        ),
                        SizedBox(height: 4.h),
                        CustomPrimaryText(
                          text:
                              history.updatedAt?.toFormattedDateTime() ??
                              'Unknown date',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: firstIndex
                              ? isDark
                                    ? AppColors.primaryBorderColor
                                    : AppColors.greyColor
                              : isDark
                              ? AppColors.darkSecondaryTextColor
                              : AppColors.greyColor,
                        ),
                      ],
                    ),
                  ),
                  color: firstIndex ? Color(0xFF00C950) : Color(0xFFD1D5DC),
                  isLast: (order.statusHistories?.length ?? 0) - 1 == index,
                ),
              );
            }),
        ],
      ),
    );
  }
}
