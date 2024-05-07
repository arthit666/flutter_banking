import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxService {
  static const prefToken = 'token';
  UserPreference();

  // === Set Shared Preferences ===

  setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefToken, value);
  }

  // === Get Shared Preferences ===

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(prefToken);
  }

  // === ETC ===

  clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(prefToken);
  }
}
