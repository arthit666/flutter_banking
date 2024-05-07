import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/application/base/base_view.dart';
import 'package:init_app/assets/r.dart';
import 'package:init_app/commons/utils/string_utils.dart';
import 'package:init_app/commons/utils/list_utils.dart';
import 'package:init_app/models/_network/account_detail.dart';
import 'package:init_app/models/_network/pocket_response.dart';
import 'package:init_app/ui/_style/text_styles.dart';
import 'package:init_app/ui/_theme/app_theme.dart';
import 'package:init_app/ui/dialog/custom_dialog.dart';
import 'package:init_app/ui/home/home.vm.dart';

// ignore: must_be_immutable
class HomeView extends BaseView<HomeVM> {
  final TextEditingController _pocketTitle = TextEditingController();
  final TextEditingController _pocketDesc = TextEditingController();
  final TextEditingController _pocketAmount = TextEditingController(text: '0');
  HomeView({super.key});

  String get name => '/splash_screen';

  @override
  void onInit() async {
    _initObserver();
    _init();
    super.onInit();
  }

  _initObserver() {
    controller.failureResponse.listen((String failureResponse) {
      showAlertMessageDialog(
        failureResponse,
      );
    });
  }

  _init() async {
    controller.init();
  }

  _onCreatePocket() {
    context!.createPocketDialog(
      'Create Pocket',
      _pocketTitle,
      _pocketDesc,
      _pocketAmount,
      onCreate: () {
        controller.createPocket(
          title: _pocketTitle.text,
          des: _pocketDesc.text,
          balance: double.parse(_pocketAmount.text),
        );
      },
    );
  }

  _onTransfer(int fromId) {
    context!.transferDialog(
      'Transfer',
      fromId,
      onTransfer: (int toId, double amount) {
        controller.transferPockerBalance(
          from: fromId,
          amount: amount,
          to: toId,
        );
      },
    );
  }

  Widget _header(String accountNumber) {
    return Container(
      width: MediaQuery.of(context!).size.width,
      height: MediaQuery.of(context!).size.height / 7,
      decoration: BoxDecoration(
        color: ThemeData().background(),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cloud Pocket',
                      style: context!.textLargeBold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      accountNumber,
                      style: context!.textSmall,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: ThemeData().primaryIcon(),
                      size: 25.0,
                    ),
                    Text(
                      'history',
                      style: context!.textSmall,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cloudPocketlabel({required Function() onCreate}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cloud Pocket',
                    style: context!.textLargeBold,
                  ),
                  Text(
                    'ของฉัน',
                    style: context!.textMedium.copyWith(
                      color: ThemeData().secondaryText(),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  onCreate.call();
                },
                child: Text(
                  'สร้าง Cloud Pocket +',
                  style: context!.textLargeBold.copyWith(
                    color: ThemeData().primary().withGreen(150),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _cashBox(String balance) {
    return Container(
      width: MediaQuery.of(context!).size.width,
      height: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ThemeData().background(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Image.asset(
              icon.iconLogo,
              height: 50,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cashbox',
                  style: context!.textMedium,
                ),
                Text(
                  balance,
                  style: context!.textMediumBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pocketContent(
    String pocketName,
    String balance, {
    Function()? onDelete,
    Function()? onTap,
    Function()? onTransfer,
  }) {
    return InkWell(
      splashColor: ThemeData().background3(),
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ThemeData().background(),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.2,
                blurRadius: 4,
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    icon.iconLogo,
                    height: 90,
                  ),
                  Text(
                    pocketName,
                    style: context!.textMedium,
                  ),
                  Text(
                    balance,
                    style: context!.textMediumBold,
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      onDelete?.call();
                    },
                    child: Icon(
                      Icons.delete,
                      color: ThemeData().alert(),
                      size: 24.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      onTransfer?.call();
                    },
                    child: Icon(
                      Icons.double_arrow_rounded,
                      color: ThemeData().primary(),
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pocketListContent(List<PocketResponse>? pocketList) {
    if (pocketList.isBlank) return const Text('empty');
    return Container(
      height: 360,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: Scrollbar(
        child: GridView.builder(
          padding:
              const EdgeInsets.only(top: 10, left: 2, right: 2, bottom: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1,
          ),
          itemCount: pocketList!.length,
          itemBuilder: (context, index) {
            PocketResponse pocketResponse = pocketList[index];
            return _pocketContent(
              pocketResponse.title ?? '',
              '฿ ${pocketResponse.balance?.toStringAsFixed(2).toNumberFormat() ?? 0}',
              onDelete: () {
                controller.deletePocket(pocketId: pocketResponse.id!);
              },
              onTransfer: () {
                _onTransfer(pocketResponse.id!);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _content(AccountDetail? accountDetail) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 30),
          _cashBox(
            '฿ ${accountDetail?.balance?.toStringAsFixed(2).toNumberFormat() ?? 0}',
          ),
          const SizedBox(height: 20),
          _cloudPocketlabel(
            onCreate: () {
              _onCreatePocket();
            },
          ),
          const SizedBox(height: 10),
          _pocketListContent(accountDetail?.pocketList ?? []),
        ],
      ),
    );
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(icon.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(
          () => Column(
            children: [
              _header(controller.accountDetail.value?.accountNumber ?? ''),
              _content(controller.accountDetail.value),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Cloud Pocket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: 'Banking',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: ThemeData().primary(),
        onTap: (int index) {
          ///
        },
      ),
    );
  }
}
