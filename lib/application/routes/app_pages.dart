import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:init_app/ui/home/home.bindind.dart';
import 'package:init_app/ui/home/home.view.dart';
import 'package:init_app/ui/login/login.bindind.dart';
import 'package:init_app/ui/login/login.view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
