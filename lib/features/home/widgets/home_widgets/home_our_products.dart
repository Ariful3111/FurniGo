import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/home/controller/get_products_by_type_controller.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_our_product_filter.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_design.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_text.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';

class HomeOurProducts extends GetWidget<GetProductsByTypeController> {
  const HomeOurProducts({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Color(0xFFBCBAC9),
      Color(0xFFDEC4AF),
      Color(0xFFD28E8D),
      Color(0xFF86765B),
    ];

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HomeHelper.categoryTitle(
            title: 'Our Products',
            onTap: () {},
            isDark: isDark,
          ),
          SizedBox(height: 16.h),
          HomeOurProductFilter(),
          SizedBox(height: 16.h),
          Obx(() {
            return SizedBox(
              height: 250.h,
              child: controller.isLoading.value
                  ? ButtonLoading()
                  : ListView.builder(
                      itemCount: controller.products.value?.data.length ?? 0,
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
                                productID:
                                    controller.products.value?.data[index].id
                                        .toInt() ??
                                    0,

                                image:
                                    controller
                                            .products
                                            .value
                                            ?.data[index]
                                            .media
                                            .isNotEmpty ==
                                        true
                                    ? controller
                                              .products
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
                                color: color,
                                title:
                                    controller
                                        .products
                                        .value
                                        ?.data[index]
                                        .name ??
                                    '',
                                price:
                                    '\$${controller.products.value?.data[index].price.toDouble().toPrecision(2) ?? '0.00'}',
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            );
          }),
        ],
      ),
    );
  }
}
