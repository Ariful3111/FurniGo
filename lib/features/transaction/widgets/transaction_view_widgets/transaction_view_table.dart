import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_controller.dart';
import 'package:zb_dezign/features/transaction/models/transaction_model.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_table_expanded.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_view_table_filter.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_view_button.dart';

class TransactionViewTable extends GetWidget<TransactionController> {
  const TransactionViewTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionViewTableFilter(),
        SizedBox(height: 12.h),
        Obx(() {
          final tableRows = controller.transaction
              .map(
                (trans) => {
                  'id': trans.id,
                  'status': trans.status,
                  'title': 'Transaction ID',
                  'model': trans,
                },
              )
              .toList();
          final expandedFlag = controller.expandedList.toList();
          return CustomTable(
            rows: tableRows,
            id: 'id',
            status: 'status',
            title: 'title',
            expandedList: expandedFlag,
            onExpand: (index) {
              controller.expandedList[index] =
                  !controller.expandedList[index];
            },
            buildExpanded: (index, row) {
              final TransactionModel transactionModel =
                  row['model'] as TransactionModel;
              return TransactionTableExpanded(
                transactionModel: transactionModel,
              );
            },
            headerList: controller.transTableColumn,
            action: SizedBox.shrink(),
            actionBuilder: (index, row) {
              final TransactionModel transactionModel =
                  row['model'] as TransactionModel;
              return Row(
                children: [
                  CustomTableViewButton(
                    onTap: () {
                       Get.toNamed(AppRoutes.transactionDetailView, arguments: transactionModel);
                    },
                  ),
                  SizedBox(width: 8.w),
                  CustomTableViewButton(icon: IconsPath.download, onTap: () {}),
                ],
              );
            },
          );
        }),
      ],
    );
  }
}
