import 'dart:convert';

/// Dimension formatter utility class
class DimensionFormatter {
  /// Parse dimensions data (handles both Map and JSON String)
  static Map<String, dynamic> parseDimensions(dynamic dimensionsData) {
    if (dimensionsData == null) return {};

    if (dimensionsData is String) {
      try {
        return json.decode(dimensionsData);
      } catch (e) {
        return {};
      }
    } else if (dimensionsData is Map) {
      return Map<String, dynamic>.from(dimensionsData);
    }

    return {};
  }

  /// Format dimension key to readable title
  /// Example: "weight_kg" → "Weight Kg"
  static String formatKey(String key) {
    return key
        .replaceAll('_', ' ')
        .split(' ')
        .map(
          (word) => word.isEmpty
              ? ''
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }

  /// Format dimension value with appropriate unit
  static String formatValue(dynamic value, String key) {
    if (value == null) return 'N/A';

    double? numValue = double.tryParse(value.toString());
    if (numValue != null) {
      String formatted = numValue.toStringAsFixed(2);

      // Add units based on key type
      if (_isWeightKey(key)) {
        return '$formatted kg';
      } else if (_isDimensionKey(key)) {
        return '$formatted cm';
      }

      return formatted;
    }

    return value.toString();
  }

  /// Convert dimensions map to list of title-value pairs
  static List<Map<String, String>> toList(Map<String, dynamic> dimensionsMap) {
    return dimensionsMap.entries.map((entry) {
      return {
        "title": formatKey(entry.key),
        "value": formatValue(entry.value, entry.key),
      };
    }).toList();
  }

  /// Check if key represents a weight measurement
  static bool _isWeightKey(String key) {
    return key.contains('weight') || key.contains('kg');
  }

  /// Check if key represents a dimension measurement
  static bool _isDimensionKey(String key) {
    return key.contains('cm') ||
        key.contains('height') ||
        key.contains('width') ||
        key.contains('depth') ||
        key.contains('length');
  }
}
