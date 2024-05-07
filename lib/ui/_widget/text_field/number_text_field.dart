import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/ui/_style/text_styles.dart';
import 'package:init_app/ui/_theme/app_theme.dart';
import 'package:init_app/ui/_widget/text_field/input_done_view.dart';

class NumberTextField extends StatefulWidget {
  final Function(int value) onChanged;
  final String? title;
  final bool requiredField;
  final bool enabled;

  const NumberTextField({
    super.key,
    required this.onChanged,
    this.title,
    this.requiredField = false,
    this.enabled = true,
  });

  @override
  _NumberTextFieldState createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  final TextEditingController _textEditingController =
      TextEditingController(text: '0');
  final FocusNode _focusNode = FocusNode();

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
    _textEditingController.selection =
        TextSelection.collapsed(offset: _textEditingController.text.length);
  }

  Widget _header() {
    return Visibility(
      visible: widget.title != null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              (widget.title ?? '').tr,
              style: context.textSmallBold,
            ),
            Visibility(
              visible: widget.requiredField,
              child: Text(
                ' *',
                style:
                    context.textSmallBold.copyWith(color: ThemeData().alert()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeData().border(),
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: TextField(
        focusNode: _focusNode,
        enabled: widget.enabled,
        controller: _textEditingController,
        keyboardType: TextInputType.number,
        maxLines: 1,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
          ),
        ),
        onChanged: (String text) {
          int number = int.parse(text);
          widget.onChanged(number);
        },
      ),
    );
  }

  Widget _increaseButton() {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: ThemeData().background2(),
          border: Border(
            top: BorderSide(
              color: ThemeData().border(),
              style: BorderStyle.solid,
            ),
            bottom: BorderSide(
              color: ThemeData().border(),
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Icon(Icons.add, color: ThemeData().primaryIcon()),
      ),
      onTap: () {
        if (!widget.enabled) return;
        String text = _textEditingController.text;
        int number = int.parse(text);
        number += 1;
        _textEditingController.text = '$number';
        widget.onChanged(number);
      },
    );
  }

  Widget _decreaseButton() {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: ThemeData().background2(),
          border: Border.all(
            color: ThemeData().border(),
            width: 1,
          ),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(10),
          ),
        ),
        child: Icon(Icons.remove, color: ThemeData().primaryIcon()),
      ),
      onTap: () {
        if (!widget.enabled) return;
        String text = _textEditingController.text;
        int number = int.parse(text);
        number -= 1;
        if (number < 0) {
          number = 0;
        }
        _textEditingController.text = '$number';
        widget.onChanged(number);
      },
    );
  }

  Widget _textFieldContent() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 6, child: _textField()),
          Expanded(flex: 1, child: _increaseButton()),
          Expanded(flex: 1, child: _decreaseButton()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        _textFieldContent(),
      ],
    );
  }
}
