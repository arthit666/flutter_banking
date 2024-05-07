import 'package:intl/intl.dart';

extension StringUtil on String {
  String getLocaleText() {
    switch (this) {
      case 'en':
        return 'English';
      case 'th':
        return 'ไทย';
      default:
        return '';
    }
  }

  String? toNumberFormat({bool decimal = true}) {
    try {
      var doubleValue = double.parse(this);
      final oCcyDec = NumberFormat("#,##0.00", "en_US");
      final oCcy = NumberFormat("#,##0.##", "en_US");
      return decimal ? oCcyDec.format(doubleValue) : oCcy.format(doubleValue);
    } catch (e) {
      return null;
    }
  }
}

extension StringOptionalUtil on String? {
  bool isBlank() {
    return this == null || this == '';
  }
}
