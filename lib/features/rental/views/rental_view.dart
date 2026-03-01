import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controller/rental_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_view_widgets/rental_table.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/custom_pagination/custom_pagination.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_view_widgets/rental_search.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_view_widgets/rental_status_type.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';

class RentalView extends StatelessWidget {
  const RentalView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RentalController rentalController = Get.find();
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(title: 'Rental', onDrawerTap: () {showDialog(context: context, builder: (context) => CustomDrawer());}),
          SizedBox(height: 12.h),
          rentalsTop(isDark: isDark),
          SizedBox(height: 16.h),
          RentalStatusType(),
          SizedBox(height: 12.h),
          Align(alignment: Alignment.centerRight, child: RentalSearch()),
          SizedBox(height: 12.h),
          RentalTable(),
          SizedBox(height: 24.h),
          CustomPagination(
            currentPage: rentalController.currentPage,
            totalPage: rentalController.totalPages,
          ),
        ],
      ),
    );
  }
}
