import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderItem extends StatelessWidget {
  final OrderData order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: order.status ?? "",
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.labelColor,
        ),
        SizedBox(height: 2.h),
        CustomSpanText(
          title: 'Tracking Number: ',
          spanText: order.id ?? "",
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.secondaryTextColor,
          fontWeight: FontWeight.w400,
          spanColor: isDark ? AppColors.whiteColor : AppColors.lightGreyColor,
          spanFontWeight: FontWeight.w400,
        ),
        SizedBox(height: 16.h),
        ...List.generate(order.items?.length ?? 0, (index) {
          final item = order.items?[index];
          return SharedContainer(
            margin: EdgeInsets.only(bottom: 12.h),
            radius: 16.r,
            padding: EdgeInsets.all(12.r),
            color: isDark ? AppColors.darkColor : Color(0xFFF3F3F3),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(6.r),
                  child: CachedNetworkImage(
                    imageUrl: item?.productImage ?? "",
                    height: 48.h,
                    width: 48.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomPrimaryText(
                    text: item?.productName ?? "",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.lightGreyColor,
                    maxLine: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
