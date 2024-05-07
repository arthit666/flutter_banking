import 'package:flutter/material.dart';
import 'package:init_app/ui/_theme/color_theme/color_theme.dart';

class ColorThemeDark extends ColorTheme {
  @override
  Color get primaryColor => const Color(0xFF1CDAC5);

  @override
  Color get secondaryColor => const Color(0xFF508855);

  @override
  Color get primaryTextColor => const Color(0xFFFFFFFF);

  @override
  Color get secondaryTextColor => const Color(0xFFBDBDBD);

  @override
  Color get accentColor => const Color(0xFFFFFFFF);

  @override
  Color get backgroundColor => const Color(0xFFFFFFFF);

  @override
  Color get background2Color => const Color(0xFFFAFAFA);

  @override
  Color get background3Color => const Color(0xFFEAEAEA);

  @override
  Color get borderColor => const Color(0xFFEAEAEA);

  @override
  Color get primaryIconColor => const Color(0xFF8F8F8F);

  @override
  Color get secondaryIconColor => const Color(0xFFBDBDBD);

  @override
  Color get alertColor => const Color(0xFFFF5858);

  @override
  Color get blueColor => const Color(0xFF6996E6);

  @override
  Color get greenColor => const Color(0xFF32C040);

  @override
  Color get amberColor => Colors.amber;

  @override
  Color get sectionStatBackgroundColor => const Color(0xFFF0F0F0);

  @override
  Color get dividerColor => const Color(0xFFEAEAEA);

  @override
  Color get dropdownBackgroundColor => backgroundColor;
}
