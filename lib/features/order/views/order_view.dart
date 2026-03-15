import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/order/controller/order_controller.dart';
import 'package:zb_dezign/features/order/widgets/order_widgets/order_button.dart';
import 'package:zb_dezign/features/order/widgets/order_widgets/order_header.dart';
import 'package:zb_dezign/features/order/widgets/order_widgets/order_info.dart';
import 'package:zb_dezign/features/order/widgets/order_widgets/order_item.dart';
import 'package:zb_dezign/features/order/widgets/order_widgets/order_status.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Order',
            onDrawerTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDrawer();
                },
              );
            },
          ),
          SizedBox(height: 12.h),
          OrderHeader(),
          SizedBox(height: 16.h),
          ...List.generate(3, (index) {
            return SharedContainer(
              margin: EdgeInsets.only(bottom: 2 == index ? 0 : 16.h),
              padding: EdgeInsets.all(24.r),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.isShowInfo.value =
                            !controller.isShowInfo.value;
                      },
                      child: OrderInfo(),
                    ),
                    SizedBox(height: 20.h),
                    OrderButton(),
                    AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      child: controller.isShowInfo.value
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.h),
                                CustomDivider(),
                                SizedBox(height: 20.h),
                                OrderItem(),
                                OrderStatus(),
                              ],
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
