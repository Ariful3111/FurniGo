import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentItemDialogList extends StatelessWidget {
  const RentItemDialogList({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalQuotesController controller = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Obx(() {
        final approved = controller.approvedItems;
        final revised = controller.revisedItems;
        final allItems = [...approved, ...revised];
        return ListView.separated(
          itemCount: allItems.length,
          separatorBuilder: (_, _) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final item = allItems[index];
            final isApproved = index < approved.length;
            final qty = _parseInt(item['qty']);
            final unit = _parseMoney(item['price']);
            final charge = _parseMoney(item['charge']);
            final discount = _parseMoney(item['discount(3%)']);
            final total = (qty * unit) + charge - discount;
            return Row(
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
                        text: (item['name'] ?? 'Furniture').toString(),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                      Row(
                        children: [
                          CustomPrimaryText(
                            text: 'Qty: $qty',
                            fontSize: 10.sp,
                            color: isDark ? Colors.white54 : Colors.black45,
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: isApproved
                                  ? Colors.green.withOpacity(0.1)
                                  : AppColors.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              isApproved ? 'Approved' : 'Requested Change',
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: isApproved
                                    ? Colors.green
                                    : AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomPrimaryText(
                  text: '\$${total.toStringAsFixed(2)}',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ],
            );
          },
        );
      }),
    );
  }

  int _parseInt(dynamic value) {
    if (value is int) return value;
    final raw = (value ?? '').toString().trim();
    return int.tryParse(raw) ?? 0;
  }

  double _parseMoney(dynamic value) {
    if (value is num) return value.toDouble();
    final raw = (value ?? '').toString();
    final cleaned = raw.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0;
  }
}
