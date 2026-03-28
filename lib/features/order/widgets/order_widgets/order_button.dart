import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';

class OrderButton extends StatelessWidget {
  final OrderData order;
  const OrderButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button(
            text: 'Download Invoices',
            icon: IconsPath.download,
            onPressed: () {},
            isDark: isDark,
          ),
          if (Get.currentRoute != AppRoutes.orderDetailsView) ...[
            SizedBox(width: 12.w),
            button(
              text: 'View Details',
              icon: IconsPath.view,
              onPressed: () {
                Get.toNamed(
                  AppRoutes.orderDetailsView,
                  arguments: order.id.toString(),
                );
              },
              isDark: isDark,
            ),
          ],
        ],
      ),
    );
  }

  Widget button({
    required String text,
    required String icon,
    required VoidCallback onPressed,
    required bool isDark,
  }) {
    return CustomSecondaryButton(
      text: text,
      icon: icon,
      onPressed: onPressed,
      border: Border.all(
        width: 1.r,
        color: isDark ? AppColors.darkBorderColor : AppColors.buttonBorderColor,
      ),
      backgroundColor: isDark ? AppColors.darkColor : AppColors.whiteColor,
      textColor: isDark ? AppColors.whiteColor : AppColors.labelColor,
    );
  }
}
