import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class CommercialPendingBranding extends GetWidget<RentalDetailsController> {
  const CommercialPendingBranding({super.key});

  @override
  Widget build(BuildContext context) {
    final details = controller.rentalDetails.value;

    if (details == null) {
      return const SizedBox.shrink();
    }

    List<Map<String, String>> brandingData = [];

    // Add branding requirement
    if (details.additionalNotes?.brandingRequired != null) {
      brandingData.add({
        'title': 'Branding Required',
        'value': details.additionalNotes!.brandingRequired! ? 'Yes' : 'No',
      });
    }

    // Add branding elements
    if (details.additionalNotes?.brandingElements != null &&
        details.additionalNotes!.brandingElements!.isNotEmpty) {
      brandingData.add({
        'title': 'Branding Elements',
        'value': details.additionalNotes!.brandingElements!.join(', '),
      });
    }

    // Add custom requests if they contain branding-related info
    if (details.additionalNotes?.customRequests != null &&
        details.additionalNotes!.customRequests!.isNotEmpty) {
      brandingData.add({
        'title': 'Custom Branding Requests',
        'value': details.additionalNotes!.customRequests ?? '',
      });
    }

    // If no branding data, show a default message
    if (brandingData.isEmpty) {
      brandingData.add({
        'title': 'Branding & Customization',
        'value': 'No branding requirements specified',
      });
    }

    return DetailsRowModel(data: brandingData);
  }
}
