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

  /// Formats to relative time (e.g., "2 days ago", "Just now")
  String toRelativeTime() {
    try {
      DateTime dateTime = DateTime.parse(this);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 365) {
        return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() > 1 ? 's' : ''} ago';
      } else if (difference.inDays > 30) {
        return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() > 1 ? 's' : ''} ago';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return this;
    }
  }
}
