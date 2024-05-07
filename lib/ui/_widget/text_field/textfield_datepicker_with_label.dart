import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/ui/_style/text_styles.dart';
import 'package:init_app/ui/_theme/app_theme.dart';

class TextFieldDatePickerWithLabel extends StatelessWidget {
  final String? title;
  final String? hintText;
  final int? minLine;
  final TextEditingController? controller;
  final Function onTap;
  final bool requiredField;
  final Widget? iconPrefix;
  final String? errorText;

  const TextFieldDatePickerWithLabel({
    super.key,
    this.title,
    this.hintText,
    this.minLine,
    this.controller,
    required this.onTap,
    this.requiredField = false,
    this.iconPrefix,
    this.errorText,
  });

  Widget _title(BuildContext context) {
    return Row(
      children: [
        iconPrefix ?? Container(),
        Row(
          children: [
            Text(
              (title ?? '').tr,
              style: context.textSmallBold,
            ),
            requiredField
                ? Text(
                    ' *',
                    style: context.textSmallBold.copyWith(
                      color: ThemeData().alert(),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }

  Widget _textField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeData().background2(),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () {
          onTap();
        },
        maxLines: minLine ?? 1,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          errorText: errorText,
          hintStyle:
              context.textMedium.copyWith(color: ThemeData().secondaryText()),
          hintText: (hintText ?? '').tr,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(context),
        const SizedBox(height: 10),
        _textField(context),
      ],
    );
  }
}
