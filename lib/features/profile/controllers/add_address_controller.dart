import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/get_user_address_controller.dart';
import 'package:zb_dezign/features/profile/repositories/add_address_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class AddAddressController extends GetxController {
  final AddAddressRepository addAddressRepository;

  // Controllers grouped for better organization
  final Map<String, TextEditingController> controllers = {
    'label': TextEditingController(),
    'name': TextEditingController(),
    'address1': TextEditingController(),
    'address2': TextEditingController(),
    'city': TextEditingController(),
    'state': TextEditingController(),
    'country': TextEditingController(),
    'zip': TextEditingController(),
    'phone': TextEditingController(),
  };

  // Address Type
  RxString addressType = 'home'.obs;
  RxBool isDefault = false.obs;
  RxBool isLoading = false.obs;
  RxString countryCode = "".obs;

  AddAddressController({required this.addAddressRepository});

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  // Extract only digits from phone number (remove country code, spaces, dashes, etc.)
  String extractPhoneDigits(String phoneNumber) {
    // Remove all non-digit characters
    return phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
  }

  // Validation method
  String? validateFields() {
    final requiredFields = {
      'label': 'address label',
      'name': 'your name',
      'address1': 'address line 1',
      'city': 'city',
      'state': 'state',
      'country': 'country',
      'zip': 'zip code',
      'phone': 'phone number',
    };

    for (final field in requiredFields.entries) {
      if (controllers[field.key]!.text.trim().isEmpty) {
        return 'Please enter ${field.value}';
      }
    }

    // Phone validation - extract digits and check length
    final phoneDigits = extractPhoneDigits(controllers['phone']!.text.trim());
    if (phoneDigits.length < 10) {
      return 'Please enter a valid phone number';
    }

    return null; // No validation error
  }

  Future<void> addAddress() async {
    // Validate fields first
    final validationError = validateFields();
    if (validationError != null) {
      ErrorSnackbar.show(description: validationError);
      return;
    }

    // Use the complete phone number as stored in controller (with country code)
    final completePhone = countryCode.value + controllers['phone']!.text.trim();

    isLoading.value = true;
    final response = await addAddressRepository.execute(
      name: controllers['label']!.text.trim(),
      phone:
          completePhone, // Send complete phone number with country code to API
      addressLine1: controllers['address1']!.text.trim(),
      addressLine2: controllers['address2']!.text.trim(),
      city: controllers['city']!.text.trim(),
      state: controllers['state']!.text.trim(),
      postalCode: controllers['zip']!.text.trim(),
      country: controllers['country']!.text.trim(),
      type: addressType.value,
      isDefault: isDefault.value,
    );

    response.fold(
      (error) {
        isLoading.value = false;
        ErrorSnackbar.show(description: error.message);
      },
      (success) async {
        await Get.find<GetUserAddressController>().getUserAddress();
        isLoading.value = false;
        Get.back();
      },
    );
  }
}
