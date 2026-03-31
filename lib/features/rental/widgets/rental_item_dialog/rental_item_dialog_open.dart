import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rent_item_dialog_view.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rental_item_dialog_open_button.dart';

class RentalItemDialogOpen extends GetWidget<RentalDetailsController> {
  const RentalItemDialogOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final details = controller.rentalDetails.value;
      if (details == null) {
        return const SizedBox.shrink();
      }

      return GestureDetector(
        onTap: () {
          showGeneralDialog(
            context: context,
            barrierLabel: 'Quote Details',
            barrierDismissible: true,
            barrierColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      Get.back();
                    }
                  },
                  child: RentItemDialogView(),
                ),
              );
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              final offsetAnimation =
                  Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    ),
                  );
              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
        child: RentalItemDialogOpenButton(),
      );
    });
  }
}
