import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/ai_design/controller/ai_design_controller.dart';
import 'package:zb_dezign/features/ai_design/models/ai_design_model.dart';
import 'package:zb_dezign/features/ai_design/widgets/ai_design_view_widgets/ai_design_table_expanded.dart';
import 'package:zb_dezign/features/ai_design/widgets/ai_design_view_widgets/ai_design_table_filter.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table.dart';

class AiDesignTable extends StatelessWidget {
  const AiDesignTable({super.key});

  @override
  Widget build(BuildContext context) {
    AiDesignController aiDesignController = Get.find();
    return Column(
      children: [
        AiDesignTableFilter(),
        SizedBox(height: 12.h),
        Obx(() {
          final tableRows = aiDesignController.filteredAi
              .map(
                (ai) => {
                  'id': ai.id,
                  'type': ai.type,
                  'title': 'Generation ID',
                  'model': ai,
                },
              )
              .toList();
          final expandedFlag = aiDesignController.expandedList.toList();
          return CustomTable(
            rows: tableRows,
            id: 'id',
            status: 'type',
            isStatus: false,
            title: 'title',
            expandedList: expandedFlag,
            onExpand: (index) {
              aiDesignController.expandedList[index] =
                  !aiDesignController.expandedList[index];
            },
            buildExpanded: (index, row) {
              final AiDesignModel aiDesignModel = row['model'] as AiDesignModel;
              return AiDesignTableExpanded(aiDesignModel: aiDesignModel);
            },
            headerList: aiDesignController.aiTableColumn,
            action: SizedBox.shrink(),
            actionBuilder: (index, row) {
              final AiDesignModel aiDesignModel = row['model'] as AiDesignModel;
              return CustomSecondaryButton(
                text: 'View Details',
                icon: IconsPath.view,
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.aiDesignDetailsView,
                    arguments: aiDesignModel,
                  );
                },
              );
            },
          );
        }),
      ],
    );
  }
}
