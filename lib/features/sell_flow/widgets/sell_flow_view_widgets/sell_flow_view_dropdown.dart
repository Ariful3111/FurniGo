import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';

class SellFlowViewDropdown extends StatelessWidget {
  final ItemFormModel item;
  const SellFlowViewDropdown({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomDropdownMenu(
              key: ValueKey(item.category.value),
              label: "Select category",
              isSelect: item.category,
              option: ["Chair", "Table", "Sofa", "Bed"],
              onSelect: (value) {
                item.category.value = value!;
              },
            ),
          ),
          SizedBox(width: 8.w),
          AnimatedOpacity(
            opacity: item.category.value.isNotEmpty ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: item.category.value.isNotEmpty ? 48.w : 0,
              height: item.category.value.isNotEmpty ? 48.h : 0,
              child: GestureDetector(
                onTap: () {
                  item.category.value = "";
                },
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      IconsPath.delete,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
