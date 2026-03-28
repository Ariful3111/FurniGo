import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_view_widgets/sell_flow_view_details_fields.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellFlowViewDetails extends GetWidget<SellFlowController> {
  const SellFlowViewDetails({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return Column(
            children: List.generate(controller.items.length, (index) {
              final itemWidget = SellFlowViewDetailsFields(
                item: controller.items[index],
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index > 0) ...[CustomDivider(), SizedBox(height: 16.h)],
                  CustomPrimaryText(
                    text: "Item details",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                  ),
                  SizedBox(height: 20.h),
                  itemWidget,
                ],
              );
            }),
          );
        }),
        CustomSecondaryButton(
          text: "Add another item",
          icon: IconsPath.propertyAdd,
          onPressed: () {
            controller.addItem();
          },
        ),
      ],
    );
  }
}
