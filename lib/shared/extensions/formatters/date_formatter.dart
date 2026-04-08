import 'package:intl/intl.dart';

extension DateFormatter on String {
  /// Formats ISO 8601 date string to "MMM dd, yyyy" format
  /// Example: "2026-03-28T05:02:16+00:00" → "Mar 28, 2026"
  String toFormattedDate() {
    try {
      // Parse the ISO 8601 date string
      DateTime dateTime = DateTime.parse(this);
      // Format to "MMM dd, yyyy" (e.g., "Mar 28, 2026")
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } catch (e) {
      // Return original string if parsing fails
      return this;
    }
  }

  /// Formats ISO 8601 date string with time
  /// Example: "2026-03-28T05:02:16+00:00" → "Mar 28, 2026 05:02 AM"
  String toFormattedDateTime() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
    } catch (e) {
      return this;
    }
  }

  /// Formats to smart relative time (e.g., "Today", "Yesterday", "5 days ago", "Jan 15, 2024")
  String toRelativeTime() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return dateTime.toSmartRelativeTime();
    } catch (e) {
      return this;
    }
  }
}

/// Extension for DateTime objects
extension DateTimeFormatter on DateTime {
  /// Formats DateTime to smart relative time
  /// Examples: "Today", "Yesterday", "5 days ago", "2 weeks ago", "Jan 15, 2024"
  String toSmartRelativeTime() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else {
      return DateFormat('MMM dd, yyyy').format(this);
    }
  }

  /// Formats DateTime to "MMM dd, yyyy" format
  /// Example: DateTime(2024, 1, 15) → "Jan 15, 2024"
  String toFormattedDate() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  /// Formats DateTime with time
  /// Example: DateTime(2024, 1, 15, 10, 30) → "Jan 15, 2024 10:30 AM"
  String toFormattedDateTime() {
    return DateFormat('MMM dd, yyyy hh:mm a').format(this);
  }
}
