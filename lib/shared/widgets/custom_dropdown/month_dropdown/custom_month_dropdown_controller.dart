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
    isOpen.value = true;
    _overlayEntry = _buildOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void closeDropdown() {
    isOpen.value = false;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void selectOption(String option) {
    selectedOption.value = option;
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
