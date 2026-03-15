import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rent_item_dialog_header.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentItemDialogList extends GetWidget<RentalQuotesController> {
  const RentItemDialogList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: Obx(() {
        final approved = controller.approvedItems;
        final revised = controller.revisedItems;
        final allItems = [...approved, ...revised];

        final furnitureItems = allItems
            .where((i) => i['category'] == 'furniture')
            .toList();
        final applianceItems = allItems
            .where((i) => i['category'] == 'appliance')
            .toList();

        return ListView(
          children: [
            RentItemDialogHeader(
              title: 'Furniture',
              itemCount: '${furnitureItems.length}',
            ),
            SizedBox(height: 24.h,),
            if (furnitureItems.isNotEmpty) ...[
              _buildListSection(context, furnitureItems, approved, isDark),
              SizedBox(height: 24.h,),
            ],
            RentItemDialogHeader(
              title: 'Appliances',
              itemCount: '${applianceItems.length}',
            ),
            SizedBox(height: 24.h,),
            if (applianceItems.isNotEmpty) ...[
              _buildListSection(context, applianceItems, approved, isDark),
            ],
          ],
        );
      }),
    );
  }

  Widget _buildListSection(
    BuildContext context,
    List<Map<String, dynamic>> items,
    List<Map<String, dynamic>> approvedList,
    bool isDark,
  ) {
    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        final isApproved = approvedList.contains(item);
        return Padding(
          padding:  EdgeInsets.only(bottom:items.length-1==index?0: 16.h),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(
                      (item['image'] ?? IconsPath.furniture).toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: (item['name'] ?? 'Item').toString(),
                      fontSize: 16.sp,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkTextColor,
                    ),
                    Row(
                      children: [
                        CustomPrimaryText(
                          text: 'Qty: ${item['qty']}',
                          fontSize: 12.sp,
                          color: isDark
                              ? AppColors.primaryBorderColor
                              : Color(0xFF737373),
                        ),
                        SizedBox(width: 7.3.w),
                        CustomPrimaryText(
                          text: '|',
                          fontSize: 12.sp,
                          color: isDark
                              ? AppColors.primaryBorderColor
                              : Color(0xFF737373),
                        ),
                        SizedBox(width: 7.3.w),
                        CustomPrimaryText(
                          text: isApproved ? 'Approved' : 'Requested Change',
                          fontSize: 12.sp,
                          color: isDark
                              ? AppColors.primaryBorderColor
                              : Color(0xFF737373),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomPrimaryText(
                text: item['price'].toString(),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ],
          ),
        );
      }),
    );
  }
}
