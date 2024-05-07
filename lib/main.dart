import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:init_app/application/binding/initial_binding.dart';
import 'package:init_app/application/env.dart';
import 'package:init_app/application/routes/app_pages.dart';
import 'package:init_app/assets/i18n/languages.dart';
import 'package:init_app/ui/_theme/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
  List<Locale> getSupportedLocal() {
    return [
      const Locale('en', ''),
    ];
  }

  runApp(
    GetMaterialApp(
      title: DevLocalEnvironment().getAppTitle(),
      initialBinding: InitialBinding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      translations: Languages(),
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: getSupportedLocal(),
    ),
  );
}
