import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_transaction_model.dart';

class AiController extends GetxController {
  final List<CreditTransaction> creditItems = [
    CreditTransaction(
      title: "Room interior design",
      date: "12/12/2025, 5:40 PM",
      amount: -15,
    ),
    CreditTransaction(
      title: "Credit added",
      date: "12/12/2025, 5:40 PM",
      amount: 200,
    ),
    CreditTransaction(
      title: "Product placement",
      date: "12/12/2025, 5:40 PM",
      amount: -20,
    ),
    CreditTransaction(
      title: "Room interior design",
      date: "12/12/2025, 5:40 PM",
      amount: -15,
    ),
    CreditTransaction(
      title: "Credit added",
      date: "12/12/2025, 5:40 PM",
      amount: 200,
    ),
    CreditTransaction(
      title: "Product placement",
      date: "12/12/2025, 5:40 PM",
      amount: -20,
    ),
    CreditTransaction(
      title: "Room interior design",
      date: "12/12/2025, 5:40 PM",
      amount: -15,
    ),
    CreditTransaction(
      title: "Credit added",
      date: "12/12/2025, 5:40 PM",
      amount: 200,
    ),
    CreditTransaction(
      title: "Product placement",
      date: "12/12/2025, 5:40 PM",
      amount: -20,
    ),
  ];
   OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();

  void toggleDropdown(BuildContext context) {
    if (overlayEntry == null) {
      overlayEntry = _createOverlay(context);
      Overlay.of(context).insert(overlayEntry!);
    } else {
      closeDropdown();
    }
  }

  void closeDropdown() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  OverlayEntry _createOverlay(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: closeDropdown,
            child: Container(color: Colors.transparent),
          ),
          Positioned(
            width: 300.w,
            child: CompositedTransformFollower(
              link: layerLink,
              offset: Offset(-120, 50.h),
              showWhenUnlinked: false,
              child:AiDropdownCredit(),
            ),
          ),
        ],
      ),
    );
  }
}
