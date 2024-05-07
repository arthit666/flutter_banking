import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/ui/_style/text_styles.dart';
import 'package:init_app/ui/_theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double borderRadius;
  final double elevation;
  final Color? buttonColor;
  final Color? textColor;
  final bool isEnable;
  final BorderSide? borderSide;
  final double? fontSize;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 10,
    this.elevation = 0,
    this.buttonColor,
    this.textColor,
    this.isEnable = true,
    this.borderSide,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: buttonColor ?? ThemeData().primary(),
          disabledBackgroundColor: ThemeData().primary().withOpacity(0.5),
        ),
        onPressed: isEnable ? onPressed : null,
        child: Text(
          title.tr,
          style: context.textMediumBold.copyWith(
              fontSize: fontSize, color: textColor ?? ThemeData().accent()),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
