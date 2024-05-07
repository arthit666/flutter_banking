import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/ui/_style/text_styles.dart';
import 'package:init_app/ui/_theme/app_theme.dart';
import 'package:init_app/ui/_widget/text_field/textfield_with_label.dart';
import 'package:init_app/ui/dialog/tranfers_dialog.dart';

extension customDialog on BuildContext {
  alertMessageDialog(
    String content, {
    String? title,
    bool? isRequiredField,
  }) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        elevation: 0,
        backgroundColor: ThemeData().background(),
        title: Text(
          (title ?? '').tr,
          textAlign: TextAlign.center,
          style: context.textLargeBold,
        ),
        content: RichText(
          text: TextSpan(
            text: content.tr,
            style: context.textMedium,
            children: <TextSpan>[
              if (isRequiredField ?? false)
                TextSpan(
                  text: " *",
                  style:
                      context.textMedium.copyWith(color: ThemeData().alert()),
                ),
            ],
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ThemeData().alert(), // background
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'close',
                    style: context.textSmallBold
                        .copyWith(color: ThemeData().accent()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  createPocketDialog(
    String title,
    TextEditingController pocketTitle,
    TextEditingController pocketDes,
    TextEditingController pocketAmount, {
    Function()? onCreate,
  }) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        elevation: 0,
        backgroundColor: ThemeData().background(),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: context.textLargeBold,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWithLabel(
              controller: pocketTitle,
              title: 'Title',
              hintText: 'pocket title',
              requiredField: true,
            ),
            const SizedBox(height: 20),
            TextFieldWithLabel(
              keyboardType: TextInputType.number,
              controller: pocketAmount,
              title: 'Amount',
              hintText: '0',
            ),
            const SizedBox(height: 20),
            TextFieldWithLabel(
              maxLine: 2,
              controller: pocketDes,
              title: 'Desciption',
              hintText: 'desciption',
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ThemeData().primary(), // background
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  onCreate?.call();
                  pocketTitle.clear();
                  pocketDes.clear();
                  pocketAmount.text = '0';
                },
                child: Text(
                  'Create Pocket',
                  style: context.textSmallBold
                      .copyWith(color: ThemeData().accent()),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ThemeData().alert(), // background
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
                  style: context.textSmallBold
                      .copyWith(color: ThemeData().accent()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  transferDialog(
    String title,
    int fromId, {
    required Function(int toId, double amount) onTransfer,
  }) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        elevation: 0,
        backgroundColor: ThemeData().background(),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: context.textLargeBold,
        ),
        content: TransferDialog(
          fromId: fromId,
          onTransfer: onTransfer,
        ),
      ),
    );
  }
}
