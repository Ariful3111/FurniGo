import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_helper.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_view_widgets/sell_flow_next.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_header.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_step_count.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellFlowViews extends GetView<SellFlowController> {
  const SellFlowViews({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        controller: controller.sellFlowController,
        children: [
          CustomAppbar(
            title: 'Sell',
            onDrawerTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
          SizedBox(height: 32.h),
          Column(
            children: [
              FlowHeader(
                title: 'Sell Furniture',
                sub: 'List your furniture and reach real buyers.',
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SharedContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Center(
                    child: FlowPageCount(
                      text: controller
                          .sellFlowTitle[controller.currentIndex.value],
                      pageCount: "${controller.currentIndex.value + 1}"
                          .toString(),
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                CustomDivider(),
                SizedBox(height: 24.h),
                Obx(
                  () => controller.sellWidgets[controller.currentIndex.value],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (controller.currentIndex.value != 0)
                  SellFlowHelper().myButton(
                    border: Border.all(
                      color: AppColors.buttonBorderColor,
                      width: 1.r,
                    ),
                    onTap: () {
                      if (controller.currentIndex.value > 0) {
                        controller.sellFlowController.animateTo(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                          controller
                              .sellFlowController
                              .position
                              .minScrollExtent,
                        );
                        controller.currentIndex.value--;
                      }
                    },
                    child: CustomPrimaryText(
                      text: 'Previous',
                      fontSize: 12.sp,
                      color: AppColors.labelColor,
                    ),
                  ),
                controller.currentIndex.value > 0
                    ? FlowStepCount(
                        currentPage: controller.currentIndex.value.toString(),
                        totalPage: {
                          controller.sellWidgets.length - 1,
                        }.toString(),
                      )
                    : SizedBox.shrink(),
                SellFlowNext(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
