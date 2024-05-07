import 'dart:async';
import 'package:dio/dio.dart' as Http;
import 'package:get/get.dart';
import 'package:init_app/commons/enum.dart';
import 'package:init_app/commons/utils/list_utils.dart';
import 'package:init_app/data/services/base_service/base_service.dart';
import 'package:init_app/models/_network/account_detail.dart';
import 'package:init_app/models/_network/authentication.dart';
import 'package:init_app/models/_network/pocket_response.dart';

class ApiService extends GetxService {
  final BaseService _baseService = Get.find<BaseService>();

  Future<List<PocketResponse>?> getPocketList(
    String url,
  ) async {
    return await _baseService
        .request(
      url,
      Method.GET,
    )
        .then((Http.Response<dynamic>? res) {
      List<PocketResponse>? data = toListOf(res?.data)
          .map((json) => PocketResponse.fromJson(json))
          .toList();
      return data;
    });
  }

  Future<AccountDetail?> getAccountDetail(
    String url,
  ) async {
    return await _baseService
        .request(
      url,
      Method.GET,
    )
        .then((Http.Response<dynamic>? res) {
      return AccountDetail.fromJson(res?.data);
    });
  }

  Future<bool?> createPocket(
    String url,
    Map<String, dynamic> data,
  ) async {
    return await _baseService
        .request(url, Method.POST, data: data)
        .then((Http.Response<dynamic>? res) {
      return true;
    });
  }

  Future<bool?> deletePocket(
    String url,
  ) async {
    return await _baseService
        .request(url, Method.DELETE)
        .then((Http.Response<dynamic>? res) {
      return true;
    });
  }

  Future<bool?> transferPockerBalance(
    String url,
    Map<String, dynamic> data,
  ) async {
    return await _baseService
        .request(url, Method.POST, data: data)
        .then((Http.Response<dynamic>? res) {
      return true;
    });
  }

  Future<Authentication?> authentication(
    String url,
    Map<String, dynamic> data,
  ) async {
    return await _baseService
        .request(
      url,
      Method.POST,
      data: data,
    )
        .then((Http.Response<dynamic>? res) {
      return Authentication.fromJson(res?.data);
    });
  }
}
