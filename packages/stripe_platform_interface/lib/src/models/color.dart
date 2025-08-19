import 'package:flutter/painting.dart';

/// Deserialization object for colors.
///
/// This object is used to translate Flutter color objects to hex strings used by the stripe sdk.
class ColorKey {
  const ColorKey();

  static String? toJson(Color? color) {
    if (color != null) {
      return '#${color.colorHexString.toUpperCase()}';
    }
    return null;
  }

  static Color? fromJson(value) {
    throw UnimplementedError();
  }
}

extension ColorX on Color {
  String get colorHexString {
    try {
      // ✅ Flutter 3.22+ (double 0–1)
      final rValue = (this as dynamic).r;
      final gValue = (this as dynamic).g;
      final bValue = (this as dynamic).b;
      final aValue = (this as dynamic).a;

      final red = (rValue * 255).toInt().toRadixString(16).padLeft(2, '0');
      final green = (gValue * 255).toInt().toRadixString(16).padLeft(2, '0');
      final blue = (bValue * 255).toInt().toRadixString(16).padLeft(2, '0');
      final alpha = (aValue * 255).toInt().toRadixString(16).padLeft(2, '0');

      return '$alpha$red$green$blue';
    } catch (_) {
      // ✅ Flutter ≤3.19.x (int 0–255)
      final red = this.red.toRadixString(16).padLeft(2, '0');
      final green = this.green.toRadixString(16).padLeft(2, '0');
      final blue = this.blue.toRadixString(16).padLeft(2, '0');
      final alpha = this.alpha.toRadixString(16).padLeft(2, '0');

      return '$alpha$red$green$blue';
    }
  }
}
