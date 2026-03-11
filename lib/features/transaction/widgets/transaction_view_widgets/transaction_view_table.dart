import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_controller.dart';
import 'package:zb_dezign/features/transaction/models/transaction_model.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_table_expanded.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_view_table_filter.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_action_button.dart';

class TransactionViewTable extends StatelessWidget {
  const TransactionViewTable({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionController transactionController = Get.find();
    return Column(
      children: [
        TransactionViewTableFilter(),
        SizedBox(height: 12.h),
        Obx(() {
          final tableRows = transactionController.transaction
              .map(
                (trans) => {
                  'id': trans.id,
                  'status': trans.status,
                  'title': 'Transaction ID',
                  'model': trans,
                },
              )
              .toList();
          final expandedFlag = transactionController.expandedList.toList();
          return CustomTable(
            rows: tableRows,
            id: 'id',
            status: 'status',
            title: 'title',
            expandedList: expandedFlag,
            onExpand: (index) {
              transactionController.expandedList[index] =
                  !transactionController.expandedList[index];
            },
            buildExpanded: (index, row) {
              final TransactionModel transactionModel = row['model'] as TransactionModel;
              return TransactionTableExpanded(transactionModel: transactionModel);
            },
            headerList: transactionController.transTableColumn,
            action: SizedBox.shrink(),
            actionBuilder: (index, row) {
              final TransactionModel transactionModel = row['model'] as TransactionModel;
              return CustomTableActionButton(
                onTap: () {
                  // Get.toNamed(AppRoutes.sellDetails, arguments: sellModel);
                },
              );
            },
          );
        }),
      ],
    );
  }
}
