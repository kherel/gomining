import 'package:flutter/material.dart';

class BrandColors {
  static const Color backgroundBase = Color(0xFFFFFFFF);
  static const Color backgroundAlternative = Color(0xffF5F6FA);
  static final Color backgroundSunken = fromHSBA(230, 2, 98, 1.0);

  static final Color fillWeek = gray100;
  static final Color fillWeeker = gray20;

  static final Color brand = fromHSBA(230, 65, 85, 1.0);
  static final Color brand700 = fromHSBA(230, 65, 85, 0.7);
  static final Color brand800 = fromHSBA(230, 65, 85, 0.8);
  static final Color brand200 = fromHSBA(230, 65, 85, 0.2);
  static final Color brand50 = fromHSBA(230, 65, 100, 0.05);

  static final Color gray = fromHSBA(230, 100, 15, 0.90);
  static final Color gray700 = fromHSBA(230, 100, 20, 0.65);
  static final Color gray500 = fromHSBA(230, 100, 30, 0.45);
  static final Color gray100 = Color(0xff001166).withValues(alpha: 0.1);
  static final Color gray20 = Color(0xff001580).withValues(alpha: 0.02);

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

  static final Color textStrong = gray;
  static final Color textWeak = gray700;
  static final Color textBrand = brand;

  static final Color textError = red;

  static final Color fillBrand = brand;

  static final Color brandFocus = brand;

  static final Color strokeStrong = gray500;
  static final Color strokeWeak = gray100;
  static final Color strokeDisabled = gray100;

  static final Color strokeBrand = brand800;
  static final Color strokeError = red800;

  static final Color iconBrand = brand800;
  static final Color iconNatural = gray500;
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
