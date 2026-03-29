import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingPeriod extends GetWidget<RentalDetailsController> {
  const PendingPeriod({super.key});

  @override
  Widget build(BuildContext context) {
    final details = controller.rentalDetails.value;

    if (details == null) {
      return const SizedBox.shrink();
    }

    List<Map<String, String>> periodData = [];

    // Add rental term information
    if (details.rentalTerm != null) {
      periodData.add({
        'title': 'Rental Term',
        'value':
            '${details.rentalTerm!.name ?? ''} (${details.rentalTerm!.days ?? 0} days)',
      });
    } else if (details.rentalTerms?.rentalTermDays != null) {
      periodData.add({
        'title': 'Rental Term (days)',
        'value': '${details.rentalTerms!.rentalTermDays} days',
      });
    }

    // Add payment frequency
    if (details.rentalTerms?.paymentFrequency != null) {
      periodData.add({
        'title': 'Payment Frequency',
        'value': details.rentalTerms!.paymentFrequency!.capitalizeFirst ?? '',
      });
    }

    // Add discount information
    if (details.rentalTerm?.discountPercent != null &&
        details.rentalTerm!.discountPercent! > 0) {
      periodData.add({
        'title': 'Discount',
        'value': '${details.rentalTerm!.discountPercent}%',
      });
    } else if (details.rentalTerms?.rentalTermDiscount != null &&
        details.rentalTerms!.rentalTermDiscount! > 0) {
      periodData.add({
        'title': 'Discount',
        'value': '${details.rentalTerms!.rentalTermDiscount}%',
      });
    }

    // Add pricing preference
    if (details.rentalTerms?.pricingPreference != null) {
      periodData.add({
        'title': 'Pricing Preference',
        'value': details.rentalTerms!.pricingPreference!.capitalizeFirst ?? '',
      });
    }

    // Add start date
    if (details.startDate != null) {
      periodData.add({'title': 'Start Date', 'value': details.startDate ?? ''});
    }

    // Add end date
    if (details.endDate != null) {
      periodData.add({'title': 'End Date', 'value': details.endDate ?? ''});
    }

    // Add installment schedule if available
    if (details.rentalTerms?.installmentSchedule != null) {
      final schedule = details.rentalTerms!.installmentSchedule!;
      String installmentValue = '';
      if (schedule.upfront != null) {
        installmentValue += 'Upfront: ${schedule.upfront}, ';
      }
      if (schedule.secondPayment != null) {
        installmentValue += 'Second: ${schedule.secondPayment}, ';
      }
      if (schedule.finalPayment != null) {
        installmentValue += 'Final: ${schedule.finalPayment}';
      }
      // Remove trailing comma and space
      if (installmentValue.endsWith(', ')) {
        installmentValue = installmentValue.substring(
          0,
          installmentValue.length - 2,
        );
      }

      if (installmentValue.isNotEmpty) {
        periodData.add({
          'title': 'Installment Schedule',
          'value': installmentValue,
        });
      }
    }

    return DetailsRowModel(data: periodData);
  }
}
