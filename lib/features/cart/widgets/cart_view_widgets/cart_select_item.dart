import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CartSelectItem extends GetWidget<CartController> {
  const CartSelectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCheckBox(
                isChecked: controller.isAllSelected.value,
                onChange: (_) => controller.toggleSelectAll(),
              ),
              CustomPrimaryText(
                text: "Select All",
                fontSize: 14,
                color: AppColors.lightTextColor,
              ),
            ],
          ),
          GestureDetector(
            onTap: controller.deleteAll,
            child: Row(
              children: [
                Image.asset(IconsPath.delete, height: 16.h, width: 16.w),
                SizedBox(width: 6.w),
                CustomPrimaryText(
                  text: "Delete All",
                  fontSize: 14,
                  color: AppColors.lightTextColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
