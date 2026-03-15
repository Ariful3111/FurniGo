import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/dashboard/controller/dashboard_controller.dart';
import 'package:zb_dezign/features/dashboard/models/recent_order_model.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_table_expanded.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_property_header.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class DashboardTable extends GetWidget<DashboardController> {
  const DashboardTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.r),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.labelColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 69.h,
            child: DashboardPropertyHeader(title: 'Recent orders', onTap: () {  },)),
          CustomDivider(),
          Obx(() {
            final tableRows = controller.recentOrderModel
                .map(
                  (order) => {
                    'id': order.id,
                    'status': order.status,
                    'title': 'order ID',
                    'model': order,
                  },
                )
                .toList();
            final expandedFlags = controller.expandedList.toList();
            return CustomTable(
              rows: tableRows,
              id: 'id',
              status: 'status',
              title: 'title',
              expandedList: expandedFlags,
              onExpand: (index) {
                controller.expandedList[index] =
                    !controller.expandedList[index];
              },
              buildExpanded: (index, row) {
                final RecentOrderModel orderModel =
                    row['model'] as RecentOrderModel;
                return DashboardTableExpanded(orderModel: orderModel);
              },
              headerList: controller.dashboardTableColumn,
              action: Padding(
                padding:  EdgeInsets.only(left: 25.w),
                child: CustomPrimaryText(
                  text: 'Track',
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.lightGreyColor,
                      textAlign: TextAlign.center,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
