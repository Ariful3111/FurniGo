import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_header.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_row.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CustomTable extends StatelessWidget {
  final List rows;
  final String id;
  final String status;
  final String title;
  final List<bool> expandedList;
  final void Function(int index) onExpand;
  final Widget Function(int index, dynamic row) buildExpanded;
  final List<String> headerList;
  final Widget action;
  const CustomTable({
    super.key,
    required this.rows,
    required this.id,
    required this.status,
    required this.title,
    required this.expandedList,
    required this.onExpand,
    required this.buildExpanded,
    required this.headerList,
    required this.action,
  });
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(0.r),
      child: Column(
        children: [
          CustomTableHeader(headerList: headerList),
          Divider(
            thickness: 1,
            height: 0,
            color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
          ),
          CustomTableRow(
            rows: rows,
            expandedList: expandedList,
            onExpand: onExpand,
            id: id,
            status: status,
            title: title,
            buildExpanded: buildExpanded,
            action: action,
          ),
        ],
      ),
    );
  }
}
