import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/home/controller/get_new_arrivals_controller.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_design.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_text.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';

class HomeNewArrival extends GetWidget<GetNewArrivalsController> {
  const HomeNewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : SizedBox(
              height: 250.h,
              child: ListView.builder(
                itemCount: controller.newArrivals.value?.data.length ?? 0,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeProductDesign(
                          onFavorite: () {},
                          onCart: () {},
                          productID: controller
                              .newArrivals
                              .value!
                              .data[index]
                              .id
                              .toInt(),
                          image:
                              controller
                                      .newArrivals
                                      .value
                                      ?.data[index]
                                      .media
                                      .isNotEmpty ==
                                  true
                              ? controller
                                        .newArrivals
                                        .value
                                        ?.data[index]
                                        .media
                                        .first
                                        .url ??
                                    ''
                              : '',
                        ),
                        SizedBox(height: 14.h),
                        HomeProductText(
                          color: AppColors.productColorList,
                          title:
                              controller.newArrivals.value?.data[index].name
                                  .toString() ??
                              '',
                          price:
                              '\$${controller.newArrivals.value?.data[index].price.toDouble().toPrecision(2) ?? 0.0}',
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
    });
  }
}
