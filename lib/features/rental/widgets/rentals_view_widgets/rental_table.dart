import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/rental/controller/rental_controller.dart';
import 'package:zb_dezign/features/rental/model/rental_model.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_view_widgets/rental_expanded_table.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_action_button.dart';

class RentalTable extends GetWidget<RentalController> {
  const RentalTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final tableRows = controller.filteredRentals
          .map(
            (rental) => {
              'id': rental.id,
              'status': rental.status,
              'title': 'RENTAL ID',
              'model': rental,
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
          controller.expandedList[index] = !controller.expandedList[index];
        },
        buildExpanded: (index, row) {
          final RentalModel rentalModel = row['model'] as RentalModel;
          return RentalExpandedTable(rental: rentalModel);
        },
        headerList: controller.rentalTableColumn,
        action: SizedBox.shrink(),
        actionBuilder: (index, row) {
          return CustomTableActionButton(
            onTap: () {
              final RentalModel rentalModel = row['model'] as RentalModel;
              Get.toNamed(AppRoutes.rentalPendingView, arguments: rentalModel);
            },
          );
        },
      );
    });
  }
}
