import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_controller.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_view_table.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/custom_pagination/custom_pagination.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Transaction',
            onDrawerTap: () {
              CustomDialogAnimation().showAnimatedDialog(
                context: context,
                dialog: CustomDrawer(),
                isDark: isDark,
              );
            },
          ),
          SizedBox(height: 12.h),
          SharedContainer(
            radius: 12.r,
            padding: EdgeInsets.all(12.r),
            child: CustomPrimaryText(
              text: 'Transaction',
              color: isDark ? AppColors.whiteColor : AppColors.titleColor,
            ),
          ),
          SizedBox(height: 16.h),
          TransactionViewTable(),
          SizedBox(height: 24.h),
          CustomPagination(
            currentPage: controller.currentPage,
            totalPage: controller.totalPages,
          ),
        ],
      ),
    );
  }
}
