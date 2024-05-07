import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:init_app/ui/_style/text_styles.dart';
import 'package:init_app/ui/_theme/app_theme.dart';
import 'package:init_app/ui/_widget/text_field/text_content_ios.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String? title;
  final String? hintText;
  final int? maxLine;
  final Icon? prefixIcon;
  final Widget? suffixIconButton;
  final double? height;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool readOnly;
  final bool requiredField;
  final bool showLabel;
  final bool inValid;
  final bool? obscureText;
  final Widget? icon;
  final Function(String text)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;

  const TextFieldWithLabel({
    super.key,
    this.title,
    this.hintText,
    this.maxLine = 1,
    this.prefixIcon,
    this.suffixIconButton,
    this.height,
    this.keyboardType,
    this.controller,
    this.readOnly = false,
    this.requiredField = false,
    this.showLabel = true,
    this.inValid = false,
    this.obscureText,
    this.icon,
    this.onChanged,
    this.inputFormatters,
    this.contentPadding,
  });

  Widget _textField(BuildContext context, TextInputType? keyboardType) {
    if (Platform.isIOS && keyboardType == TextInputType.number) {
      return TextContentIOS(
        readOnly: readOnly,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLine: maxLine,
        hintText: hintText,
        contentPadding: contentPadding,
        inValid: inValid,
        icon: icon,
        prefixIcon: prefixIcon,
        onChanged: (String value) {
          if (onChanged == null) return;
          onChanged!.call(value);
        },
      );
    }
    return TextField(
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLines: maxLine,
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintStyle:
            context.textSmall.copyWith(color: ThemeData().secondaryText()),
        hintText: (hintText ?? '').tr,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: inValid ? Colors.red : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIconButton,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (String value) {
        if (onChanged == null) return;
        onChanged!.call(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showLabel,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon ?? Container(),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        (title ?? '').tr,
                        style: context.textSmallBold,
                      ),
                      requiredField
                          ? Text(
                              ' *',
                              style: context.textSmallBold
                                  .copyWith(color: ThemeData().alert()),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: ThemeData().background2(),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: _textField(context, keyboardType),
        ),
      ],
    );
  }
}
