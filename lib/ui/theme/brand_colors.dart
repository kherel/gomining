import 'package:flutter/material.dart';

class BrandColors {
  static final Color white = Color(0xffffffff);

  static final Color brand = Color(0xff6E43E6);
  static final Color brand700 = brand.withValues(alpha: 0.7);
  static final Color brand800 = brand.withValues(alpha: 0.8);
  static final Color brand200 = brand.withValues(alpha: 0.2);
  static final Color brand50 = brand.withValues(alpha: 0.05);

  static Color white80 = Color(0xFFFFFFFF).withValues(alpha: 0.8);
  static Color white60 = Color(0xFFFFFFFF).withValues(alpha: 0.6);
  static Color white10 = Color(0xFFFFFFFF).withValues(alpha: 0.1);
  static Color white4 = Color(0xFFFFFFFF).withValues(alpha: 0.04);

  static const Color dark = Color(0xFF252429);
  static const Color grey = Color(0xFF3F3E43);
  //

  static final Color gray50 = fromHSBA(230, 100, 50, 0.04);
  static final Color gray10 = fromHSBA(230, 100, 50, 0.02);

  static final Color red = fromHSBA(0, 71, 78, 1.00);
  static final Color red800 = fromHSBA(0, 71, 78, 0.8);
  static final Color red200 = fromHSBA(0, 71, 78, 0.14);
  static final Color red50 = fromHSBA(0, 71, 78, 0.05);

  static final Color green = fromHSBA(162, 95, 48, 1.00);

  // Цвет для теней
  static final Color shadowLight = fromHSBA(
    0,
    0,
    0,
    0.05,
  ); // Colors.black.withOpacity(0.05)

  static final Color textStrong = white;
  static final Color textWeak = white.withValues(alpha: 0.7);
  static final Color textBrand = brand;

  static final Color textError = red;

  static final Color fillBrand = brand;

  static final Color brandFocus = brand;

  static final Color strokeBrand = brand800;
  static final Color strokeError = red800;

  static final Color iconBrand = brand800;
}

Color fromHSBA(double h, double s, double b, double a) {
  final hsv = HSVColor.fromAHSV(
    a,
    h, // Hue (0-360)
    s / 100, // Saturation (0-1)
    b / 100, // Value/Brightness (0-1)
  );
  return hsv.toColor();
}
