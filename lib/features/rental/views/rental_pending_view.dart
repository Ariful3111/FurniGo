import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/model/rental_model.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_widgets.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_calculation.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rental_item_dialog_open.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalPendingView extends StatelessWidget {
  const RentalPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalModel rentalModel = Get.arguments as RentalModel;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: Stack(
        children: [
          ListView(
            children: [
              CustomAppbar(
                title: 'Rentals',
                onDrawerTap: () {
                  Navigator.pop(context);
                },
                icon: IconsPath.back,
              ),
              SizedBox(height: 12.h),
              rentalsTop(isDark: isDark),
              SizedBox(height: 16.h),
              SharedContainer(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomPrimaryText(
                          text: rentalModel.id,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.labelColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 12.w),
                        CustomTableStatus(status: rentalModel.status),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text: rentalModel.startDate,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.greyTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 20.h),
                    Divider(
                      color: isDark
                          ? AppColors.darkBorderColor
                          : AppColors.borderColor,
                      thickness: 1,
                      height: 0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              PendingWidgets(),
              if (rentalModel.status == 'Quote Sent') RentalQuotesCalculation(),
            ],
          ),
          Positioned(
            right: 0,
            top: (MediaQuery.heightOf(context) * 0.5) - 40.h,
            child: RentalItemDialogOpen(),
          ),
        ],
      ),
    );
  }
}
