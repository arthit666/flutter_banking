import 'package:get/get.dart';
import 'package:init_app/commons/constants/enpoint_constant.dart';
import 'package:init_app/data/services/api_service.dart';
import 'package:init_app/models/_network/account_detail.dart';
import 'package:init_app/models/_network/authentication.dart';
import 'package:init_app/models/_network/pocket_response.dart';

class ApiRepository extends GetxService {
  final ApiService _service = Get.find<ApiService>();

  Future<List<PocketResponse>?> getPocketList() async {
    Uri uri = Uri(
      path: EndPoints.pockers,
    );
    var res = await _service.getPocketList(uri.toString());
    return res;
  }

  Future<AccountDetail?> getAccountDetail() async {
    Uri uri = Uri(
      path: EndPoints.account,
    );
    var res = await _service.getAccountDetail(uri.toString());
    return res;
  }

  Future<bool?> createPocket({
    required String title,
    required String des,
    required double balance,
  }) async {
    Map<String, dynamic> data = {
      'title': title,
      'description': des,
      'balance': balance
    };
    Uri uri = Uri(
      path: EndPoints.pockers,
    );
    var res = await _service.createPocket(uri.toString(), data);
    return res;
  }

  Future<bool?> deletePocket({
    required int pocketId,
  }) async {
    Uri uri = Uri(
      path: '${EndPoints.pockers}$pocketId',
    );
    var res = await _service.deletePocket(uri.toString());
    return res;
  }

  Future<bool?> transferPockerBalance({
    required double amount,
    required int from,
    required int to,
  }) async {
    Map<String, dynamic> data = {
      'amount': amount,
      'from': from,
      'to': to,
    };
    Uri uri = Uri(
      path: EndPoints.pockersTransfer,
    );
    var res = await _service.transferPockerBalance(uri.toString(), data);
    return res;
  }

  Future<Authentication?> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    Uri uri = Uri(
      path: EndPoints.login,
    );
    var res = await _service.authentication(uri.toString(), data);
    return res;
  }
}
