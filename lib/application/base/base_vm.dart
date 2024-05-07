import 'package:get/get.dart';
import 'package:init_app/commons/enum.dart';

abstract class BaseVM extends GetxController {
  final Rx<PageState> pageState = PageState.DEFAULT.obs;
  final Rx<String> failureResponse = ''.obs;

  updatePageState(PageState state) => pageState(state);

  handleException(String nameFunc, dynamic e) async {
    updatePageState(PageState.FAILED);
    failureResponse.value = e.toString();
  }

  @override
  void onClose() {
    pageState.close();
    failureResponse.close();
    dispose();
    super.onClose();
  }
}
