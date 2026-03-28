import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';

extension EstimatedDeliveryExtractor on OrderData {
  String calculateEstimatedDelivery() {
    try {
      // Parse created_at date
      final createdAt = DateTime.parse(this.createdAt ?? '');

      // Parse delivery_time (format: "3-5 Days")
      final deliveryTime = this.deliveryTime ?? '3-5 Days';
      final regex = RegExp(r'(\d+)-?(\d+)?\s*Days?');
      final match = regex.firstMatch(deliveryTime);

      if (match != null) {
        final minDays = int.parse(match.group(1) ?? '3');
        final maxDays = int.parse(match.group(2) ?? match.group(1) ?? '3');

        final minDate = createdAt.add(Duration(days: minDays));
        final maxDate = createdAt.add(Duration(days: maxDays));

        // Format dates
        final dateFormat = DateFormat('MMM d');
        final minDateStr = dateFormat.format(minDate);
        final maxDateStr = dateFormat.format(maxDate);

        return '$minDateStr - $maxDateStr, ${maxDate.year}';
      }

      // Fallback to default if parsing fails
      return '3-5 Days';
    } catch (e) {
      debugPrint('Error calculating estimated delivery: $e');
      return deliveryTime ?? '3-5 Days';
    }
  }
}
