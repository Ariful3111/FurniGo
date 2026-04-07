import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_check_list.dart';

class ShopSearchFilterCategories extends GetWidget<ShopController> {
  const ShopSearchFilterCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ShopSearchFilterCheckList(
        scrollController: controller.categoryScrollController,
        items: controller.byCategories,
        isCheckedList: controller.isCheckedCategory,
        onTap: (index) {
          controller.isCheckedCategory[index] = !controller.isCheckedCategory[index];
        },
      ),
    );
  }
}
