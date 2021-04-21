import 'package:flutter/material.dart';

class CompanyColors {
  static const _mainColor = 0xFFDB0000;
  static const Map<int, Color> _swatch = {
    50: Color.fromRGBO(219, 0, 0, .1),
    100: Color.fromRGBO(219, 0, 0, .2),
    200: Color.fromRGBO(219, 0, 0, .3),
    300: Color.fromRGBO(219, 0, 0, .4),
    400: Color.fromRGBO(219, 0, 0, .5),
    500: Color.fromRGBO(219, 0, 0, .6),
    600: Color.fromRGBO(219, 0, 0, .7),
    700: Color.fromRGBO(219, 0, 0, .8),
    800: Color.fromRGBO(219, 0, 0, .9),
    900: Color.fromRGBO(219, 0, 0, 1),
  };

  static const MaterialColor red = const MaterialColor(_mainColor, _swatch);
}
