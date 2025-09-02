import 'package:flutter/material.dart';
import 'package:gomining_kherel/config/translations.g.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';
import 'package:gomining_kherel/ui/theme/brand_typo.dart';
import 'package:gomining_kherel/ui/widgets/brand_modal/brand_modal.dart';

class SuccessModal {
  static Future<void> show(BuildContext context) {
    return BrandModal.showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: BrandColors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: BrandColors.white, size: 32),
          ),
          const SizedBox(height: 16),
          Text(
            t.send.success.title,
            style: ThemeTypo.heading3Bold.copyWith(color: BrandColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            t.send.success.message,
            style: ThemeTypo.smallRegularWeak,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
