import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:init_app/application/base/base_view.dart';
import 'package:init_app/assets/r.dart';
import 'package:init_app/ui/_theme/app_theme.dart';
import 'package:init_app/ui/_widget/button/button.dart';
import 'package:init_app/ui/_widget/text_field/textfield_with_label.dart';
import 'package:init_app/ui/home/home.bindind.dart';
import 'package:init_app/ui/home/home.view.dart';
import 'package:init_app/ui/login/login.vm.dart';

// ignore: must_be_immutable
class LoginView extends BaseView<LoginVM> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  LoginView({super.key});

  String get name => '/login';

  @override
  void onInit() async {
    _init();
    _initObserver();
    super.onInit();
  }

  _initObserver() {
    controller.failureResponse.listen((String failureResponse) {
      showAlertMessageDialog(
        failureResponse,
      );
    });

    controller.isLoginSuccess.listen((bool isLoginSuccess) {
      if (isLoginSuccess) {
        Get.to(HomeView(), binding: HomeBinding());
      } else {
        showAlertMessageDialog(
          'email or password is wrong',
        );
      }
    });
  }

  _init() async {
    controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(icon.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 1.7,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ThemeData().background(),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 4,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Image.asset(
                    icon.iconLogo,
                    height: 170,
                  ),
                  TextFieldWithLabel(
                    controller: _email,
                    title: 'Login',
                    hintText: 'test@gmail.com',
                    requiredField: true,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWithLabel(
                    obscureText: true,
                    controller: _pass,
                    title: 'Password',
                    hintText: 'password',
                    requiredField: true,
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    title: 'Sign In',
                    onPressed: () {
                      controller.login(_email.text, _pass.text);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
