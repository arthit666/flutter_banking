import 'package:get/get.dart';
import 'package:init_app/application/base/base_vm.dart';
import 'package:init_app/data/preferences/user_preference.dart';
import 'package:init_app/data/repositories/api_repository.dart';
import 'package:init_app/models/_network/authentication.dart';

class LoginVM extends BaseVM {
  final Rx<bool> isLoginSuccess = false.obs;
  final ApiRepository _apiRepository = Get.find<ApiRepository>();
  final UserPreference _userPreference = Get.find<UserPreference>();

  init() async {
    // bool hasToken = await _userPreference.getToken() != null;
    // if (hasToken) {
    //   isLoginSuccess.value = true;
    // }
  }

  login(String email, String password) {
    _apiRepository
        .login(email: email, password: password)
        .then((Authentication? res) {
      if (res == null) {
        isLoginSuccess.value = false;
        return;
      }
      _userPreference.setToken(res.accessToken!);
      isLoginSuccess.value = true;
    }).catchError((e) {
      isLoginSuccess.value = false;
    });
  }
}
