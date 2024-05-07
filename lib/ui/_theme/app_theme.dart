import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/ui/_theme/color_theme/color_theme_dark.dart';
import 'package:init_app/ui/_theme/color_theme/color_theme_light.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    primaryColor: ColorThemeDark().primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorThemeLight().backgroundColor,
    ),
    scaffoldBackgroundColor: ColorThemeLight().backgroundColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorThemeLight().backgroundColor,
    ),
    scaffoldBackgroundColor: ColorThemeDark().backgroundColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

extension AppThemeExt on ThemeData {
  Color primary() {
    return Get.isDarkMode
        ? ColorThemeDark().primaryColor
        : ColorThemeLight().primaryColor;
  }

  Color primaryText() {
    return Get.isDarkMode
        ? ColorThemeDark().primaryTextColor
        : ColorThemeLight().primaryTextColor;
  }

  Color secondaryText() {
    return Get.isDarkMode
        ? ColorThemeDark().secondaryTextColor
        : ColorThemeLight().secondaryTextColor;
  }

  Color accent() {
    return Get.isDarkMode
        ? ColorThemeDark().accentColor
        : ColorThemeLight().accentColor;
  }

  Color background() {
    return Get.isDarkMode
        ? ColorThemeDark().backgroundColor
        : ColorThemeLight().backgroundColor;
  }

  Color background2() {
    return Get.isDarkMode
        ? ColorThemeDark().background2Color
        : ColorThemeLight().background2Color;
  }

  Color background3() {
    return Get.isDarkMode
        ? ColorThemeDark().background3Color
        : ColorThemeLight().background3Color;
  }

  Color border() {
    return Get.isDarkMode
        ? ColorThemeDark().borderColor
        : ColorThemeLight().borderColor;
  }

  Color primaryIcon() {
    return Get.isDarkMode
        ? ColorThemeDark().primaryIconColor
        : ColorThemeLight().primaryIconColor;
  }

  Color secondaryIcon() {
    return Get.isDarkMode
        ? ColorThemeDark().secondaryIconColor
        : ColorThemeLight().secondaryIconColor;
  }

  Color alert() {
    return Get.isDarkMode
        ? ColorThemeDark().alertColor
        : ColorThemeLight().alertColor;
  }

  Color blue() {
    return Get.isDarkMode
        ? ColorThemeDark().blueColor
        : ColorThemeLight().blueColor;
  }

  Color green() {
    return Get.isDarkMode
        ? ColorThemeDark().greenColor
        : ColorThemeLight().greenColor;
  }

  Color amber() {
    return Get.isDarkMode
        ? ColorThemeDark().amberColor
        : ColorThemeLight().amberColor;
  }

  Color sectionStatBackground() {
    return Get.isDarkMode
        ? ColorThemeDark().sectionStatBackgroundColor
        : ColorThemeLight().sectionStatBackgroundColor;
  }

  Color divider() {
    return Get.isDarkMode
        ? ColorThemeDark().dividerColor
        : ColorThemeLight().dividerColor;
  }

  Color dropdownBackground() {
    return Get.isDarkMode
        ? ColorThemeDark().dropdownBackgroundColor
        : ColorThemeLight().dropdownBackgroundColor;
  }
}
