import 'dart:io';

import 'package:init_app/commons/constants/constants.dart';

abstract class EnvironmentConfig {
  const EnvironmentConfig();

  final bool isDebugMode = false;

  bool get isProduction {
    return !isDebug;
  }

  bool get isDebug {
    return isDebugMode;
  }

  String getServerType();

  String getServiceApiBaseUrl();

  String getLocalHostBaseUrl();

  String getWebSocketBaseUrl();

  String getAppTitle();
}

class DevLocalEnvironment extends EnvironmentConfig {
  DevLocalEnvironment();

  @override
  String getServerType() => ServerType.devLocal;

  @override
  String getServiceApiBaseUrl() => 'https://www.melivecode.com';

  @override
  String getLocalHostBaseUrl() {
    final String localHost = Platform.isAndroid ? '10.0.2.2' : '127.0.0.1';
    return 'http://$localHost:8000/';
  }

  @override
  String getWebSocketBaseUrl() => 'ws://172.25.1.5:7972/ws';

  @override
  String getAppTitle() => 'Make';
}
