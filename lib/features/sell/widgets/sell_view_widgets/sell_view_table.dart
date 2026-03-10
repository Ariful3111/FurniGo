import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/sell/controller/sell_controller.dart';
import 'package:zb_dezign/features/sell/models/sell_model.dart';
import 'package:zb_dezign/features/sell/widgets/sell_view_widgets/sell_table_expanded.dart';
import 'package:zb_dezign/features/sell/widgets/sell_view_widgets/sell_view_table_filter.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_action_button.dart';

class SellViewTable extends StatelessWidget {
  const SellViewTable({super.key});

  @override
  Widget build(BuildContext context) {
    SellController sellController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SellViewTableFilter(),
        SizedBox(height: 12.h),
        Obx(() {
          final tableRows = sellController.filteredSell
              .map(
                (sell) => {
                  'id': sell.id,
                  'status': sell.status,
                  'title': 'Sell ID',
                  'model': sell,
                },
              )
              .toList();
          final expandedFlag = sellController.expandedList.toList();
          return CustomTable(
            rows: tableRows,
            id: 'id',
            status: 'status',
            title: 'title',
            expandedList: expandedFlag,
            onExpand: (index) {
              sellController.expandedList[index] =
                  !sellController.expandedList[index];
            },
            buildExpanded: (index, row) {
              final SellModel sellModel = row['model'] as SellModel;
              return SellTableExpanded(sellModel: sellModel);
            },
            headerList: sellController.sellTableColumn,
            action: SizedBox.shrink(),
            actionBuilder: (index, row) {
              final SellModel sellModel = row['model'] as SellModel;
              return CustomTableActionButton(
                onTap: () {
                  Get.toNamed(AppRoutes.sellDetails, arguments: sellModel);
                },
              );
            },
          );
        }),
      ],
    );
  }
}
