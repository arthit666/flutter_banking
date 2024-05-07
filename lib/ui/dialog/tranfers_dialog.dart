import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/data/repositories/api_repository.dart';
import 'package:init_app/models/_network/pocket_response.dart';
import 'package:init_app/models/rx_nullable.dart';
import 'package:init_app/ui/_style/text_styles.dart';
import 'package:init_app/ui/_theme/app_theme.dart';
import 'package:init_app/ui/_widget/text_field/textfield_with_label.dart';

class TransferDialog extends StatefulWidget {
  final int fromId;
  final Function(int toId, double amount) onTransfer;

  const TransferDialog({
    super.key,
    required this.onTransfer,
    required this.fromId,
  });

  @override
  State<TransferDialog> createState() => _TransferDialogState();
}

class _TransferDialogState extends State<TransferDialog> {
  final TextEditingController transferAmount = TextEditingController(text: '0');
  final Rx<PocketResponse?> selectedPocket =
      RxNullable<PocketResponse?>().setNull();
  final RxList<PocketResponse> pocketList = <PocketResponse>[].obs;
  final ApiRepository _apiRepository = Get.find<ApiRepository>();

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    pocketList.close();
    super.dispose();
  }

  _init() {
    _loadPocketList();
  }

  _loadPocketList() {
    _apiRepository.getPocketList().then(
      (List<PocketResponse>? res) {
        if (res == null) return;
        pocketList.value = res
            .where((PocketResponse item) => item.id != widget.fromId)
            .toList();
      },
    ).catchError((e) {
      throw e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transfer to',
                style: context.textSmallBold,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<PocketResponse>(
                    isExpanded: true,
                    hint: Text(
                      'Select Pocket',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: pocketList
                        .map((PocketResponse item) =>
                            DropdownMenuItem<PocketResponse>(
                              value: item,
                              child: Text(
                                item.title ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedPocket.value,
                    onChanged: (PocketResponse? value) {
                      selectedPocket.value = value;
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        TextFieldWithLabel(
          keyboardType: TextInputType.number,
          controller: transferAmount,
          title: 'Amount',
          hintText: '0',
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ThemeData().primary(), // background
              ),
              onPressed: () {
                if (selectedPocket.value == null) return;
                Navigator.of(context).pop();
                widget
                    .onTransfer(
                      selectedPocket.value!.id!,
                      double.parse(transferAmount.text),
                    )
                    ?.call();
              },
              child: Text(
                'Transfer',
                style:
                    context.textSmallBold.copyWith(color: ThemeData().accent()),
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
                style:
                    context.textSmallBold.copyWith(color: ThemeData().accent()),
              ),
            ),
          ],
        )
      ],
    );
  }
}
