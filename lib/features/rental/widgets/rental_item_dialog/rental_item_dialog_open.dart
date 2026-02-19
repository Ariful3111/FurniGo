import 'package:flutter/material.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rent_item_dialog_view.dart';
import 'package:zb_dezign/features/rental/widgets/rental_item_dialog/rental_item_dialog_open_button.dart';

class RentalItemDialogOpen extends StatelessWidget {
  const RentalItemDialogOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierLabel: 'Quote Details',
          barrierDismissible: true,
          barrierColor: Colors.black12,
          transitionDuration: Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Align(
              alignment: Alignment.centerRight,
              child: RentItemDialogView(),
            );
          },
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            final offsetAnimation =
                Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(
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
  }
}