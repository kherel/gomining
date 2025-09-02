import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomining_kherel/config/translations.g.dart';
import 'package:gomining_kherel/logic/cubits/wallet/wallet_cubit.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';
import 'package:gomining_kherel/ui/theme/brand_typo.dart';
import 'package:gomining_kherel/ui/widgets/brand_bottom_sheet/brand_bottom_sheet.dart';
import 'package:gomining_kherel/ui/widgets/brand_buttons/brand_buttons.dart';
import 'package:gomining_kherel/ui/widgets/brand_modal/brand_modal.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveBottomSheet extends StatelessWidget {
  const ReceiveBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      barrierColor: BrandColors.gray10,
      backgroundColor: BrandColors.dark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: BrandBottomSheet(child: ReceiveBottomSheet()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final walletState =
        context.read<WalletCubit>().state as WalletAuthenticated;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.receive.title,
            style: ThemeTypo.heading2Bold.copyWith(color: BrandColors.white),
          ),
          const SizedBox(height: 32),

          // QR Code section
          Center(
            child: Text(
              t.receive.scan_qr,
              textAlign: TextAlign.center,
              style: ThemeTypo.smallRegularStrong.copyWith(
                color: BrandColors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: BrandColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: QrImageView(
                data: walletState.address,
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Address section
          Text(
            t.receive.wallet_address,
            style: ThemeTypo.smallRegularStrong.copyWith(
              color: BrandColors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: BrandColors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              walletState.address,
              style: ThemeTypo.smallRegularStrong.copyWith(
                color: BrandColors.white,
              ),
            ),
          ),
          const Spacer(),

          BrandButtons.iconButton(
            onTap: () {
              Clipboard.setData(ClipboardData(text: walletState.address));
              BrandModal.showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      t.receive.address_copied,
                      style: ThemeTypo.smallRegularStrong.copyWith(
                        color: BrandColors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Icons.copy,
            text: t.receive.copy_button,
          ),
        ],
      ),
    );
  }
}
