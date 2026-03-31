import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingNotes extends GetWidget<RentalDetailsController> {
  const PendingNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final details = controller.rentalDetails.value;

    if (details == null) {
      return const SizedBox.shrink();
    }

    List<Map<String, String>> notesData = [];

    // Add custom requests
    if (details.additionalNotes?.customRequests != null &&
        details.additionalNotes!.customRequests!.isNotEmpty) {
      notesData.add({
        'title': 'Custom Requests',
        'value': details.additionalNotes!.customRequests ?? '',
      });
    }

    // Add branding information
    if (details.additionalNotes?.brandingRequired != null) {
      notesData.add({
        'title': 'Branding Required',
        'value': details.additionalNotes!.brandingRequired! ? 'Yes' : 'No',
      });
    }

    // Add branding elements
    if (details.additionalNotes?.brandingElements != null &&
        details.additionalNotes!.brandingElements!.isNotEmpty) {
      notesData.add({
        'title': 'Branding Elements',
        'value': details.additionalNotes!.brandingElements!.join(', '),
      });
    }

    // If no data, show a default message
    if (notesData.isEmpty) {
      notesData.add({
        'title': 'Additional Notes',
        'value': 'No additional notes provided',
      });
    }

    return DetailsRowModel(data: notesData);
  }
}
