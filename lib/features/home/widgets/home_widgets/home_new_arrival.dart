import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/home/controller/get_new_arrivals_controller.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_design.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_text.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';

class HomeNewArrival extends GetWidget<GetNewArrivalsController> {
  const HomeNewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Color(0xFFBCBAC9),
      Color(0xFFDEC4AF),
      Color(0xFFD28E8D),
      Color(0xFF86765B),
    ];

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
                          image:
                              controller
                                  .newArrivals
                                  .value
                                  ?.data[index]
                                  .media
                                  .first
                                  .url ??
                              '',
                        ),
                        SizedBox(height: 14.h),
                        HomeProductText(
                          color: color,
                          title:
                              controller.newArrivals.value?.data[index].name ??
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
