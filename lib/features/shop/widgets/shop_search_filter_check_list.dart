import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_scrollbar.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ShopSearchFilterCheckList extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> items;
  final List<bool> isCheckedList;
  final Function(int index) onTap;
  const ShopSearchFilterCheckList({
    super.key,
    required this.scrollController,
    required this.items,
    required this.isCheckedList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomScrollbar(
      scrollController: scrollController,
      child: ListView.builder(
        controller: scrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Obx(()=> GestureDetector(
            onTap: () => onTap(index),
            child: Row(
              children: [
                CustomCheckBox(
                  borderColor: AppColors.primaryBorderColor,
                  isChecked: isCheckedList[index],
                  onChange: (value) {
                    isCheckedList[index] = value;
                  },
                ),
                Expanded(
                  child: CustomPrimaryText(
                    text: items[index],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.lightTextColor,
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
