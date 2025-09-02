import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomining_kherel/logic/cubits/balance/balance_cubit.dart';
import 'package:gomining_kherel/logic/cubits/wallet/wallet_cubit.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';
import 'package:gomining_kherel/ui/theme/brand_typo.dart';
import 'package:gomining_kherel/ui/widgets/brand_bottom_sheet/brand_bottom_sheet.dart';
import 'package:gomining_kherel/ui/widgets/brand_buttons/brand_buttons.dart';
import 'package:btc_address_validate_swan/btc_address_validate_swan.dart'
    as btc_validate;

class SendBottomSheet extends StatefulWidget {
  const SendBottomSheet({super.key});

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
        child: BrandBottomSheet(child: SendBottomSheet()),
      ),
    );
  }

  @override
  State<SendBottomSheet> createState() => _SendBottomSheetState();
}

class _SendBottomSheetState extends State<SendBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _amountController = TextEditingController();

  String? _addressError;
  String? _amountError;

  @override
  void dispose() {
    _addressController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Адрес не может быть пустым';
    }

    try {
      btc_validate.validate(value);
    } catch (e) {
      return 'Неверный формат BTC адреса';
    }

    final walletState = context.read<WalletCubit>().state;
    if (walletState is WalletAuthenticated && value == walletState.address) {
      return 'Нельзя отправить самому себе';
    }

    return null;
  }

  String? _validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Сумма не может быть пустой';
    }

    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return 'Введите корректную сумму';
    }

    final balanceState = context.read<BalanceCubit>().state;
    if (balanceState is BalanceLoaded) {
      if (amount > balanceState.balance.totalBtc) {
        return 'Недостаточно средств.';
      }
    }

    return null;
  }

  void _onSendPressed() {
    setState(() {
      _addressError = _validateAddress(_addressController.text);
      _amountError = _validateAmount(_amountController.text);
    });

    if (_addressError == null && _amountError == null) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final balanceState = context.watch<BalanceCubit>().state as BalanceLoaded;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Отправить BTC',
              style: ThemeTypo.heading2Bold.copyWith(color: BrandColors.white),
            ),
            const SizedBox(height: 32),

            // Address field
            Text(
              'Адрес получателя',
              style: ThemeTypo.smallRegularStrong.copyWith(
                color: BrandColors.white,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _addressController,
              style: ThemeTypo.smallRegularStrong.copyWith(
                color: BrandColors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Введите BTC адрес',
                hintStyle: ThemeTypo.smallRegularWeak.copyWith(
                  color: BrandColors.textWeak,
                ),
                filled: true,
                fillColor: BrandColors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                errorText: _addressError,
                errorStyle: ThemeTypo.tinyRegular.copyWith(
                  color: BrandColors.red,
                ),
              ),
              onChanged: (value) {
                if (_addressError != null) {
                  setState(() {
                    _addressError = _validateAddress(value);
                  });
                }
              },
            ),
            const SizedBox(height: 24),

            // Amount field
            Text(
              'Сумма (BTC)',
              style: ThemeTypo.smallRegularStrong.copyWith(
                color: BrandColors.white,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: ThemeTypo.smallRegularStrong.copyWith(
                color: BrandColors.white,
              ),
              decoration: InputDecoration(
                hintText: '0.00000000',
                hintStyle: ThemeTypo.smallRegularWeak.copyWith(
                  color: BrandColors.textWeak,
                ),
                filled: true,
                fillColor: BrandColors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                errorText: _amountError,
                errorStyle: ThemeTypo.tinyRegular.copyWith(
                  color: BrandColors.red,
                ),
                suffixStyle: ThemeTypo.smallRegularWeak.copyWith(
                  color: BrandColors.textWeak,
                ),
              ),
              onChanged: (value) {
                if (_amountError != null) {
                  setState(() {
                    _amountError = _validateAmount(value);
                  });
                }
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Доступно: ${balanceState.balance.totalBtc.toStringAsFixed(8)} BTC',
              style: ThemeTypo.tinyRegular.copyWith(
                color: BrandColors.textWeak,
              ),
            ),
            const SizedBox(height: 32),

            // Send button
            BrandButtons.iconButton(
              onTap: _onSendPressed,
              text: 'Отправить',
              icon: Icons.send,
            ),
          ],
        ),
      ),
    );
  }
}
