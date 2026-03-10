import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/sell/controller/sell_controller.dart';
import 'package:zb_dezign/features/sell/widgets/sell_helper.dart';
import 'package:zb_dezign/features/sell/widgets/sell_view_widgets/sell_view_table.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_pagination/custom_pagination.dart';

class SellView extends StatelessWidget {
  const SellView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SellController sellController = Get.find();
    return CustomContainer(
      child: ListView(
        children: [
          SellHelper().sellHeader(context: context, isDark: isDark),
          SizedBox(height: 16.h),
          SellViewTable(),
          SizedBox(height: 24.h),
          CustomPagination(
            currentPage: sellController.currentPage,
            totalPage: sellController.totalPages,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
