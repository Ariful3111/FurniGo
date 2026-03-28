import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';

import 'package:zb_dezign/features/rental/widgets/rental_completed_widgets/rentals_complete_delivery.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_active_widgets/rentals_active_delivery_status.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_active_widgets/rentals_active_info.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_widgets.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_calculation.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rental_item_dialog_open.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalDetailsView extends GetView<RentalDetailsController> {
  const RentalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      if (controller.isLoading.value) {
        return const CustomContainer(child: ButtonLoading());
      }

      final rentalDetails = controller.rentalDetails.value;

      return CustomContainer(
        padding: EdgeInsets.all(0.r),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
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
                  rentalDetails?.status?.capitalizeFirst == 'Active' ||
                          rentalDetails?.status?.capitalizeFirst == 'Completed'
                      ? RentalsActiveInfo()
                      : SharedContainer(
                          padding: EdgeInsets.all(20.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomPrimaryText(
                                    text: rentalDetails?.uuid ?? 'N/A',
                                    color: isDark
                                        ? AppColors.whiteColor
                                        : AppColors.labelColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(width: 12.w),
                                  CustomTableStatus(
                                    status: rentalDetails?.status ?? 'Pending',
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              CustomPrimaryText(
                                text: rentalDetails?.startDate ?? 'N/A',
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
                  if (rentalDetails?.status?.capitalizeFirst == 'Quote Sent')
                    RentalQuotesCalculation(),
                  if (rentalDetails?.status?.capitalizeFirst == 'Active')
                    RentalsActiveDeliveryStatus(),
                  if (rentalDetails?.status?.capitalizeFirst == 'Completed')
                    RentalsCompleteDelivery(),
                ],
              ),
            ),
            if (rentalDetails?.status?.capitalizeFirst == 'Quote Sent')
              Positioned(
                right: 0,
                top: (MediaQuery.heightOf(context) * 0.5) - 60.h,
                child: RentalItemDialogOpen(),
              ),
          ],
        ),
      );
    });
  }
}
