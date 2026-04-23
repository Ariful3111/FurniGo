import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_user_image_overlay.dart';
import 'package:zb_dezign/features/category/controller/category_controller.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_transaction_model.dart';

class AiController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString selectedMonth = 'This Month'.obs;
  CategoryController categoryController = Get.find();

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
    final Size screenSize = MediaQuery.sizeOf(context);

    return OverlayEntry(
      builder: (overlayContext) {
        return AiUserImageOverlay(
          screenSize: screenSize,
          layerLink: layerLink,
          onDismiss: closeDropdown,
        );
      },
    );
  }

  late AnimationController animationController;
  RxDouble progress = 0.0.obs;

  void getArgument({
    required String title,
    required String sub,
    required int index,
  }) {
    title = categoryController.aiOption[index]['title'];
    sub = categoryController.aiOption[index]['sub'];
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      final int index = args['index'] ?? 0;
      if (index < categoryController.aiOption.length) {
        getArgument(
          title: args['title'] ?? '',
          sub: args['sub'] ?? '',
          index: index,
        );
      }
    }
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
