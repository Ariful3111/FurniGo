import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/features/order/widgets/order_widgets/order_button.dart';
import 'package:zb_dezign/features/order/widgets/order_widgets/order_info.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderDetailsInfo extends StatelessWidget {
  final OrderData order;
  const OrderDetailsInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderInfo(order: order),
          SizedBox(height: 12.h),
          OrderButton(order: order),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 20.h),
          CustomPrimaryText(
            text: 'Order Items',
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 16.h),
          ...List.generate(order.items?.length ?? 0, (index) {
            return SharedContainer(
              margin: EdgeInsets.only(bottom: index == 1 ? 0 : 12.h),
              color: isDark ? AppColors.darkColor : Color(0xFFF3F3F3),
              radius: 16.r,
              padding: EdgeInsets.all(12.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(6.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          order.items?.elementAt(index).productImage ?? '',
                      fit: BoxFit.cover,
                      height: 48.h,
                      width: 48.w,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPrimaryText(
                          text:
                              order.items?.elementAt(index).productName ??
                              'Unknown Product',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.lightGreyColor,
                          maxLine: 2,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              text(
                                text:
                                    order.items
                                        ?.elementAt(index)
                                        .categoryName ??
                                    'Unknown Size',
                                isDark: isDark,
                              ),
                              SizedBox(width: 11.w),
                              divider(isDark: isDark),
                              SizedBox(width: 11.w),
                              text(
                                text:
                                    order.items
                                        ?.elementAt(index)
                                        .options
                                        ?.first
                                        .displayName ??
                                    'Unknown',
                                isDark: isDark,
                              ),
                              SizedBox(width: 11.w),
                              divider(isDark: isDark),
                              SizedBox(width: 11.w),
                              text(
                                text:
                                    'Quantity: ${order.items?.elementAt(index).quantity ?? 0}',
                                isDark: isDark,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        CustomPrimaryText(
                          text:
                              '\$${order.items?.elementAt(index).totalPrice ?? 00}',
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.buttonTextColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget text({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: isDark ? AppColors.darkPrimaryTextColor : AppColors.lightTextColor,
    );
  }

  Widget divider({required bool isDark}) {
    return Container(
      height: 13.h,
      width: 1.w,
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF697483) : AppColors.lightTextColor,
      ),
    );
  }
}
