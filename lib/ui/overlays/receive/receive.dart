import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: BrandColors.dark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Center(
            child: Text(
              'Scan QR code to receive',
              textAlign: TextAlign.center,
              style: ThemeTypo.tinyRegular,
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: BrandColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: QrImageView(
                data: walletState.address,
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ),
          SizedBox(height: 47),
          Text(
            'Address:',
            textAlign: TextAlign.center,
            style: ThemeTypo.tinyRegular,
          ),
          SizedBox(height: 8),
          Text(
            walletState.address,
            textAlign: TextAlign.center,
            style: ThemeTypo.tinyRegular,
          ),
          Spacer(),
          BrandButtons.iconButton(
            onTap: () {
              Clipboard.setData(ClipboardData(text: walletState.address));
              BrandModal.showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Address copied!', style: ThemeTypo.tinyRegular),
                  ],
                ),
              );
            },
            icon: Icons.copy,
            text: 'Copy',
          ),
          SizedBox(height: 16),
          BrandButtons.iconButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            icon: Icons.close,
            text: 'Close',
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
