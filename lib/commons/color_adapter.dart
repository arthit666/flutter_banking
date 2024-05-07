import 'package:init_app/commons/utils/string_utils.dart';
import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String? hexString) {
    if (hexString.isBlank()) return Colors.transparent;
    final buffer = StringBuffer();
    if (hexString!.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
