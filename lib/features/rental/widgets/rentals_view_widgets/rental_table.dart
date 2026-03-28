import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/rental/controllers/rental_controller.dart';
import 'package:zb_dezign/features/rental/models/rentals_model.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_view_widgets/rental_expanded_table.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_action_button.dart';

class RentalTable extends GetWidget<RentalController> {
  const RentalTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final rentalsData = controller.rentals.value?.data ?? [];
      final tableRows = rentalsData
          .map(
            (rental) => {
              'id': rental.uuid?.toString() ?? '',
              'status': rental.status?.capitalizeFirst ?? '',
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
          if (index < controller.expandedList.length) {
            controller.expandedList[index] = !controller.expandedList[index];
          }
        },
        buildExpanded: (index, row) {
          return RentalExpandedTable(
            rental: index < rentalsData.length
                ? rentalsData[index]
                : RentalData(),
          );
        },
        headerList: controller.rentalTableColumn,
        action: SizedBox.shrink(),
        actionBuilder: (index, row) {
          return CustomTableActionButton(
            onTap: () {
              Get.toNamed(AppRoutes.rentalDetailsView);
            },
          );
        },
      );
    });
  }
}
