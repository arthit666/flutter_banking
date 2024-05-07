import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart' as Http;
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:init_app/commons/enum.dart';
import 'package:init_app/data/preferences/user_preference.dart';

class BaseService extends GetxService {
  final String baseUrl;
  late Dio _dio;
  final UserPreference _userPreference = Get.find<UserPreference>();

  BaseService({required this.baseUrl}) {
    initSetting();
  }

  static header() => {
        'Content-Type': 'application/json',
      };

  String basePath(String path) => '$baseUrl$path';

  Future<BaseService> initSetting() async {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _userPreference.getToken();
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          print('REQUEST[${options.method}] => PATH:${options.path} '
              '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (err, handler) {
          print(
              'ERROR[${err.response?.statusCode}] => DATA: ${err.response?.data.toString()}');
          return handler.next(err);
        },
      ),
    );
  }

  Future<Http.Response?> request(
    String url,
    Method method, {
    Map<String, dynamic>? data,
  }) async {
    Http.Response? response;
    try {
      switch (method) {
        case Method.GET:
          response = await _dio.get(url, queryParameters: data);
        case Method.POST:
          response = await _dio.post(url, data: data);
        case Method.PATCH:
          response = await _dio.patch(url, data: data);
        case Method.PUT:
          response = await _dio.put(url, data: data);
        case Method.DELETE:
          response = await _dio.delete(url);
      }
      return response;
    } on SocketException {
      throw Exception('No Internet Connection');
    } on FormatException {
      throw Exception('Bad Response Format!');
    } on DioError catch (e) {
      _checkResponseError(e);
    } catch (e) {
      throw Exception('Something Went Wrong');
    }
    return null;
  }

  void _checkResponseError(DioException? err) {
    switch (err?.response?.statusCode) {
      case 400:
        throw Exception('400 Bad Required\n${err?.response?.data.toString()}');
      case 401:
        throw Exception('401 Unauthorized');
      case 404:
        throw Exception('404 Not Found');
      case 500:
        throw Exception('500 Server Error');
      default:
        throw Exception('Something Went Wrong');
    }
  }
}

// extension ExtendResponse<I> on Http.Response<I?> {
//   Http.Response<O> mapData<O>(O Function(I? data) mapper) {
//     return Http.Response<O>(
//       data: mapper(data),
//       headers: headers,
//       requestOptions: requestOptions,
//       isRedirect: isRedirect,
//       statusCode: statusCode,
//       statusMessage: statusMessage,
//       redirects: redirects,
//       extra: extra,
//     );
//   }
// }
