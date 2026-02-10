import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/order/controller/order_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OrderHeader extends StatelessWidget {
  const OrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
    return Obx(() {
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation);
          return ClipRect(
            child: SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(opacity: animation, child: child),
            ),
          );
        },
        child: orderController.isSearch.value
            ? SizedBox(
              key: ValueKey('Field'),
              child: CustomTextFormField(
                  border: BorderSide.none,
                  labelText: 'Search Your Order',
                  maxLines: 1,
                  borderRadius: 12.r,
                  controller: orderController.orderController,
                  suffixIcon: Padding(
                    padding:  EdgeInsets.only(right: 8.w),
                    child: InkWell(
                      onTap: () {
                        orderController.isSearch.value =
                            !orderController.isSearch.value;
                      },
                      child: Image.asset(
                        IconsPath.search,
                        height: 32.h,
                        width: 32.w,
                      ),
                    ),
                  ),
                ),
            )
            : Container(
              key: ValueKey('Header'),
                height: 56.h,
                width: MediaQuery.widthOf(context),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomPrimaryText(
                      text: 'My Order',
                      color: Color(0xFF101828),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            IconsPath.download,
                            height: 32.h,
                            width: 32.w,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: () {
                            orderController.isSearch.value =
                                !orderController.isSearch.value;
                          },
                          child: Image.asset(
                            IconsPath.search,
                            height: 32.h,
                            width: 32.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
