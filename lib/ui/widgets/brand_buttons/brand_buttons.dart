import 'package:flutter/widgets.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';
import 'package:gomining_kherel/ui/theme/brand_typo.dart';

class BrandButtons {
  const BrandButtons._();

  static Widget iconButton({
    required VoidCallback onTap,
    required String text,
    Key? key,
    IconData? icon,
  }) => _IconButton(key: key, onTap: onTap, icon: icon, text: text);
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.onTap,
    required this.icon,
    required this.text,
    required super.key,
  });

  final VoidCallback onTap;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: BrandColors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: BrandColors.white),
            const SizedBox(width: 6),
            Text(
              text,
              style: ThemeTypo.heading4Bold.copyWith(color: BrandColors.white),
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
