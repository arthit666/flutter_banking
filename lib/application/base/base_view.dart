import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:init_app/application/base/base_vm.dart';
import 'package:init_app/application/life_cycle_observer.dart';
import 'package:init_app/ui/dialog/custom_dialog.dart';

abstract class BaseView<Controller extends BaseVM> extends GetView<Controller>
    implements LifeCycleListener {
  final _ContextHolder _contextHolder = _ContextHolder();

  bool isInitial = false;

  BaseView({super.key});

  BuildContext? get context => _contextHolder.context;

  @override
  void onInit() {}

  @override
  void onBuild() {}

  @override
  void onDispose() {}

  @override
  void onResume() {}

  @override
  void onPause() {}

  @override
  void onInactive() {}

  @override
  void onDetach() {}

  showAlertMessageDialog(
    String text, {
    String? title,
    int? statusCode,
    bool? isRequiredField,
    bool? isPermissionFailed,
  }) {
    context!.alertMessageDialog(
      text,
      title: title ?? 'Error',
      isRequiredField: isRequiredField,
    );
  }

  Widget render(BuildContext context);

  @override
  Widget build(BuildContext context) {
    _contextHolder.context = context;
    Future.delayed(const Duration(seconds: 0), () {
      if (!isInitial) {
        onInit();
        isInitial = true;
      }
    });
    return render(context);
  }
}

class _ContextHolder {
  BuildContext? context;
}
