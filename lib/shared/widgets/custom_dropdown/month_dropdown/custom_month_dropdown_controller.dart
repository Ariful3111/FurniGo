import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown_overlay.dart';

class CustomMonthDropdownController extends GetxController {
  final RxString selectedOption = 'This Month'.obs;
  final RxBool isOpen = false.obs;

  final List<String> options = const [
    'Today',
    'This Week',
    'This Month',
    'Last Month',
    'This Year',
  ];

  OverlayEntry? _overlayEntry;
  final LayerLink layerLink = LayerLink();

  void toggleDropdown(BuildContext context) {
    if (isOpen.value) {
      closeDropdown();
    } else {
      _openDropdown(context);
    }
  }

  void _openDropdown(BuildContext context) {
    _overlayEntry = _buildOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(const Duration(milliseconds: 10), () {
      isOpen.value = true;
    });
  }

  void closeDropdown() async {
    isOpen.value = false;

    await Future.delayed(const Duration(milliseconds: 400)); // match animation

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void selectOption(String option) async {
    selectedOption.value = option;

    await Future.delayed(const Duration(milliseconds: 100));

    closeDropdown();
  }

  OverlayEntry _buildOverlayEntry(BuildContext context) {
    return OverlayEntry(builder: (_) => CustomMonthDropdownOverlay());
  }

  @override
  void onClose() {
    closeDropdown();
    super.onClose();
  }
}
