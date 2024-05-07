import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:init_app/ui/_style/text_styles.dart';
import 'package:init_app/ui/_widget/text_field/input_done_view.dart';

class TextContentIOS extends StatefulWidget {
  final String? title;
  final String? hintText;
  final int? maxLine;
  final Icon? prefixIcon;
  final double? height;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool readOnly;
  final bool requiredField;
  final bool showLabel;
  final bool inValid;
  final Widget? icon;
  final Function(String text)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;

  const TextContentIOS({
    super.key,
    this.title,
    this.hintText,
    this.maxLine = 1,
    this.prefixIcon,
    this.height,
    this.keyboardType,
    this.controller,
    this.readOnly = false,
    this.requiredField = false,
    this.showLabel = true,
    this.inValid = false,
    this.icon,
    this.onChanged,
    this.inputFormatters,
    this.contentPadding,
  });

  @override
  _TextContentIOSState createState() => _TextContentIOSState();
}

class _TextContentIOSState extends State<TextContentIOS> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  _init() {
    _focusNode.addListener(() {
      bool hasFocus = _focusNode.hasFocus;
      if (hasFocus) {
        KeyboardOverlay.showOverlay(context);
      } else {
        KeyboardOverlay.removeOverlay();
      }
    });
    _textEditingController.text = widget.controller!.text;
    _textEditingController.selection =
        TextSelection.collapsed(offset: _textEditingController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      readOnly: widget.readOnly,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLine,
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        hintStyle: context.textSmall.copyWith(color: Colors.grey[500]),
        hintText: widget.hintText ?? '',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: widget.inValid ? Colors.red : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: widget.prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (String value) {
        if (widget.onChanged == null) return;
        widget.onChanged!.call(value);
      },
    );
  }
}
