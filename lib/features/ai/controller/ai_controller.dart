import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_transaction_model.dart';

class AiController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString selectedMonth = 'This Month'.obs;

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
    // Capture screen size here — safe inside a valid BuildContext.
    final Size screenSize = MediaQuery.sizeOf(context);

    return OverlayEntry(
      builder: (overlayContext) {
        return _AiOverlayContent(
          screenSize: screenSize,
          layerLink: layerLink,
          onDismiss: closeDropdown,
        );
      },
    );
  }

  // ── Animation ──────────────────────────────────────────────────────────────
  late AnimationController animationController;
  RxDouble progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animationController.addListener(() {
      progress.value = animationController.value;
    });
    animationController.repeat();
  }

  @override
  void onClose() {
    closeDropdown();
    animationController.dispose();
    super.onClose();
  }
}

/// Separate StatelessWidget for the overlay content.
/// This avoids putting a Stack with unbounded children directly inside the
/// OverlayEntry builder lambda, which can confuse the layout system.
class _AiOverlayContent extends StatelessWidget {
  final Size screenSize;
  final LayerLink layerLink;
  final VoidCallback onDismiss;

  const _AiOverlayContent({
    required this.screenSize,
    required this.layerLink,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── Tap-outside barrier ─────────────────────────────────────────────
        // Use an explicit SizedBox with finite dimensions instead of
        // SizedBox.expand — the overlay is not constrained, so .expand
        // causes an infinite-size layout error.
        GestureDetector(
          onTap: onDismiss,
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: ColoredBox(color: Colors.transparent),
          ),
        ),

        // ── Dropdown anchored to the trigger ───────────────────────────────
        Positioned(
          width: 300.w,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: Offset(-120, 50.h),
            showWhenUnlinked: false,
            child: const AiDropdownCredit(),
          ),
        ),
      ],
    );
  }
}