import 'package:flutter/widgets.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';

final backgroundGradient = LinearGradient(
  colors: [BrandColors.brand50, Color(0xFF252429), Color(0xFF252429)],
  stops: const [0.0, 0.51, 1.0],
  begin: Alignment(0.4, -1),
  end: Alignment(-0.9, 1),
);
