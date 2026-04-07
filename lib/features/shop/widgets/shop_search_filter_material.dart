import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_check_list.dart';

class ShopSearchFilterMaterial extends GetWidget<ShopController> {
  const ShopSearchFilterMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ShopSearchFilterCheckList(
        scrollController: controller.materialScrollController,
        items: controller.material,
        isCheckedList: controller.isCheckedMaterial,
        onTap: (index) {
          controller.isCheckedMaterial[index] =
              !controller.isCheckedMaterial[index];
        },
      ),
    );
  }
}
