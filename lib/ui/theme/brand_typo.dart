import 'package:flutter/painting.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';
import 'package:gomining_kherel/ui/utils/name_font_weight.dart';


class ThemeTypo {
  static final defaultText = TextStyle(
    fontFamily: 'Figtree',
    color: BrandColors.textWeak,
  );

  static final heading1Bold = defaultText.copyWith(
    fontSize: 40,
    height: 48 / 40,
    fontWeight: NamedWeight.bold,
    color: BrandColors.textStrong,
  );

  static final heading2RegularWeak = defaultText.copyWith(
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: -0.5,
    fontWeight: NamedWeight.regular,
  );

  static final heading2RegularStrong = heading2RegularWeak.copyWith(
    color: BrandColors.textStrong,
  );

  static final heading2Bold = heading2RegularWeak.copyWith(
    fontWeight: NamedWeight.bold,
    color: BrandColors.textStrong,
  );

  static final heading3Bold = defaultText.copyWith(
    fontSize: 24,
    height: 1.3,
    fontWeight: NamedWeight.bold,
    color: BrandColors.textStrong,
  );

  static final heading4Bold = defaultText.copyWith(
    fontSize: 20,
    height: 1.3,
    fontWeight: NamedWeight.bold,
    color: BrandColors.textStrong,
  );

  static final smallRegularWeak = defaultText.copyWith(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: NamedWeight.regular,
  );

  static final smallRegularStrong = smallRegularWeak.copyWith(
    color: BrandColors.textStrong,
  );

  static final smallBoldWeak = smallRegularWeak.copyWith(
    fontWeight: NamedWeight.bold,
  );
  static final smallBoldStrong = smallBoldWeak.copyWith(
    color: BrandColors.textStrong,
  );

  static final tinyRegular = defaultText.copyWith(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: NamedWeight.regular,
  );

  static final tinyBold = tinyRegular.copyWith(
    fontWeight: NamedWeight.bold,
    color: BrandColors.textStrong,
  );
}
