import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_check_list.dart';

class ShopSearchFilterFabric extends GetWidget<ShopController> {
  const ShopSearchFilterFabric({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ShopSearchFilterCheckList(
        scrollController: controller.fabricScrollController,
        items: controller.fabric,
        isCheckedList: controller.isCheckedFabric,
        onTap: (index) {
          controller.isCheckedFabric[index] = !controller.isCheckedFabric[index];
        },
      ),
    );
  }
}
