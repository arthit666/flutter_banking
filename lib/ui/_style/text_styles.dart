import 'package:flutter/material.dart';
import 'package:init_app/commons/color_adapter.dart';
import 'package:init_app/ui/_theme/app_theme.dart';

extension TextStyles on BuildContext {
  TextStyle get _defaultText => TextStyle(
        color: HexColor.fromHex('#8F8F8F'),
        fontFamily: 'Lato',
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  TextStyle get textExtraSmall => _defaultText.copyWith(
        fontSize: 10,
        color: ThemeData().primaryText(),
      );

  TextStyle get textSmall => _defaultText.copyWith(
        fontSize: 14,
        color: ThemeData().primaryText(),
      );

  TextStyle get textMedium => _defaultText.copyWith(
        fontSize: 16,
        color: ThemeData().primaryText(),
      );

  TextStyle get textLarge => _defaultText.copyWith(
        fontSize: 18,
        color: ThemeData().primaryText(),
      );

  TextStyle get textSmallNormal => textSmall.copyWith(
        fontWeight: FontWeight.w600,
        color: ThemeData().primaryText(),
      );

  TextStyle get textMediumNormal => textMedium.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get textLargeNormal => textLarge.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get textSmallBold => textSmall.copyWith(
        fontWeight: FontWeight.w800,
      );

  TextStyle get textMediumBold => textMedium.copyWith(
        fontWeight: FontWeight.w800,
      );

  TextStyle get textLargeBold => textLarge.copyWith(
        fontWeight: FontWeight.w800,
      );
}
