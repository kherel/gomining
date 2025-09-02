import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomining_kherel/config/translations.g.dart';
import 'package:gomining_kherel/logic/cubits/balance/balance_cubit.dart';
import 'package:gomining_kherel/logic/cubits/wallet/wallet_cubit.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';
import 'package:gomining_kherel/ui/theme/brand_typo.dart';
import 'package:gomining_kherel/ui/utils/text_input.dart';
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
  final _amountFocusNode = FocusNode();

  String? _addressError;
  String? _amountError;

  @override
  void dispose() {
    _addressController.dispose();
    _amountController.dispose();
    _amountFocusNode.dispose();
    super.dispose();
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return t.send.errors.address_empty;
    }

    try {
      btc_validate.validate(value);
    } catch (e) {
      return t.send.errors.invalid_address;
    }

    final walletState = context.read<WalletCubit>().state;
    if (walletState is WalletAuthenticated && value == walletState.address) {
      return t.send.errors.self_send;
    }

    return null;
  }

  String? _validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return t.send.errors.amount_empty;
    }

    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return t.send.errors.invalid_amount;
    }

    final balanceState = context.read<BalanceCubit>().state;
    if (balanceState is BalanceLoaded) {
      if (amount > balanceState.balance.totalBtc) {
        return t.send.errors.insufficient_funds;
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
              t.send.title,
              style: ThemeTypo.heading2Bold.copyWith(color: BrandColors.white),
            ),
            const SizedBox(height: 32),

            Text(
              t.send.recipient_address,
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
                hintText: t.send.address_hint,
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

            Text(
              t.send.amount,
              style: ThemeTypo.smallRegularStrong.copyWith(
                color: BrandColors.white,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _amountController,
              focusNode: _amountFocusNode,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: ThemeTypo.smallRegularStrong.copyWith(
                color: BrandColors.white,
              ),
              decoration: InputDecoration(
                hintText: t.send.amount_hint,
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
                formatTextInputValue(_amountController, value, 8);

                if (_amountError != null) {
                  setState(() {
                    _amountError = _validateAmount(_amountController.text);
                  });
                }
              },
              onTap: () {
                if (_amountController.text == '0' ||
                    _amountController.text == '0.0' ||
                    _amountController.text == '0,0') {
                  _amountController.clear();
                }
              },
              onEditingComplete: () {
                if (_amountController.text.isEmpty) {
                  _amountController.text = '0.0';
                } else {
                  var text = _amountController.text;

                  if (text.endsWith('.') || text.endsWith(',')) {
                    text = text.substring(0, text.length - 1);
                  }

                  if (text.isEmpty) {
                    _amountController.text = '0.0';
                  } else {
                    final formatted = double.parse(text).toString();
                    _amountController.text = formatted;
                  }
                }
                _amountFocusNode.unfocus();
              },
            ),
            const SizedBox(height: 8),
            Text(
              t.send.available.replaceAll(
                '{amount}',
                balanceState.balance.totalBtc.toStringAsFixed(8),
              ),
              style: ThemeTypo.tinyRegular.copyWith(
                color: BrandColors.textWeak,
              ),
            ),
            const Spacer(),

            BrandButtons.iconButton(
              onTap: _onSendPressed,
              text: t.send.send_button,
              icon: Icons.send,
            ),
          ],
        ),
      ),
    );
  }
}
