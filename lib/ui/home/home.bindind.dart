import 'package:get/get.dart';
import 'package:init_app/ui/home/home.vm.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeVM>(
      () => HomeVM(),
    );
  }
}
