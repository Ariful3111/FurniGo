import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableRow extends StatelessWidget {
  final List rows;
  final List<bool> expandedList;
  final void Function(int index) onExpand;
  final String id;
  final String status;
  final String title;
  final Widget Function(int index, dynamic row) buildExpanded;
  final Widget action;
  final Widget Function(int index, dynamic row)? actionBuilder;
  const CustomTableRow({
    super.key,
    required this.rows,
    required this.expandedList,
    required this.onExpand,
    required this.id,
    required this.status,
    required this.title,
    required this.buildExpanded,
    required this.action,
    this.actionBuilder,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rows.length,
      separatorBuilder: (context, index) => Divider(
        thickness: 1,
        height: 0,
        color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
      ),
      itemBuilder: (context, index) {
        final row = rows[index];
        final isRowExpanded = expandedList[index];
        final Widget child;
        if (isRowExpanded) {
          child = CustomTableExpanded(
            id: row[id],
            onTap: () => onExpand(index),
            title: row[title],
            expandedElements: buildExpanded(index, row),
          );
        } else {
          final actionWidget = actionBuilder != null
              ? actionBuilder!(index, row)
              : action;
          child = Padding(
            padding: EdgeInsets.all(12.r),
            child: InkWell(
              onTap: () => onExpand(index),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomPrimaryText(
                      text: row[id],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.titleTextColor,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: CustomTableStatus(status: row[status]),
                    ),
                  ),
                  Expanded(flex: 2, child: actionWidget),
                ],
              ),
            ),
          );
        }
        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          child: child,
        );
      },
    );
  }
}
