import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_check_list.dart';

class ShopSearchFilterWood extends GetWidget<ShopController> {
  const ShopSearchFilterWood({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ShopSearchFilterCheckList(
        scrollController: controller.woodScrollController,
        items: controller.wood,
        isCheckedList: controller.isCheckedWood,
        onTap: (index) {
          controller.isCheckedWood[index] = !controller.isCheckedWood[index];
        },
      ),
    );
  }
}
