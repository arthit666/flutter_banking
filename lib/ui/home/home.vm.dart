import 'package:get/get.dart';
import 'package:init_app/application/base/base_vm.dart';
import 'package:init_app/data/repositories/api_repository.dart';
import 'package:init_app/models/_network/account_detail.dart';
import 'package:init_app/models/rx_nullable.dart';

class HomeVM extends BaseVM {
  final Rx<AccountDetail?> accountDetail =
      RxNullable<AccountDetail?>().setNull();
  final ApiRepository _apiRepository = Get.find<ApiRepository>();
  init() {
    _loadAccountDetail();
  }

  _loadAccountDetail() {
    _apiRepository.getAccountDetail().then(
      (AccountDetail? res) {
        if (res == null) return;
        accountDetail.value = res;
      },
    ).catchError((e) {
      handleException('_loadUser', e);
    });
  }

  createPocket({
    required String title,
    required String des,
    required double balance,
  }) {
    _apiRepository
        .createPocket(
      title: title,
      des: des,
      balance: balance,
    )
        .then(
      (bool? res) {
        if (res == null) return;
        init();
      },
    ).catchError((e) {
      handleException('createPocket', e);
    });
  }

  deletePocket({
    required int pocketId,
  }) {
    _apiRepository.deletePocket(pocketId: pocketId).then(
      (bool? res) {
        if (res == null) return;
        init();
      },
    ).catchError((e) {
      handleException('deletePocket', e);
    });
  }

  transferPockerBalance({
    required double amount,
    required int from,
    required int to,
  }) {
    _apiRepository
        .transferPockerBalance(
      amount: amount,
      from: from,
      to: to,
    )
        .then(
      (bool? res) {
        if (res == null) return;
        init();
      },
    ).catchError((e) {
      handleException('transferPockerBalance', e);
    });
  }
}
