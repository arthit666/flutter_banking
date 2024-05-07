import 'package:get/get.dart';
import 'package:init_app/ui/login/login.vm.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginVM>(
      () => LoginVM(),
    );
  }
}
