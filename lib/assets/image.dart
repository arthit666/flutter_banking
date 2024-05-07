import 'package:flutter/foundation.dart';
import 'package:init_app/assets/path.dart';

@immutable
class Icon {
  //PNG
  final String iconLogo = imagePath("logo_make", "png");
  final String bg = imagePath("bg", "png");

  //SVG
  final String iconCloseCircle = imagePath("icon_close_circle", "png");
}

@immutable
class Gif {
  final String completedIndicator = gifPath("completed_indicator", "gif");
}
