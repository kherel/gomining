import 'package:flutter/material.dart';
import 'package:gomining_kherel/ui/utils/text_input.dart';

class AmountInputHandlers {
  static void onTextChanged({
    required TextEditingController controller,
    required String value,
    required int maxDecimals,
    required VoidCallback? onErrorChanged,
  }) {
    formatTextInputValue(controller, value, maxDecimals);

    final currentText = controller.text;
    if (_isZeroValue(currentText)) {
      controller.clear();
    }

    onErrorChanged?.call();
  }

  static void onTap({required TextEditingController controller}) {
    final text = controller.text;

    if (_isZeroValue(text)) {
      controller.clear();
    }
  }

  static void onEditingComplete({
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    final text = controller.text;

    if (text.isEmpty) {
      controller.text = '0.0';
    } else {
      final cleanedText = _removeTrailingSeparators(text);

      if (cleanedText.isEmpty) {
        controller.text = '0.0';
      } else {
        final formatted = _formatNumber(cleanedText);
        controller.text = formatted;
      }
    }

    focusNode.unfocus();
  }

  static void onFocusChange({
    required TextEditingController controller,
    required bool hasFocus,
    required String separator,
  }) {
    if (hasFocus) {
      _handleFocusGained(controller);
    } else {
      _handleFocusLost(controller, separator);
    }
  }

  static String? validateAmount({
    required String? value,
    required double? maxAmount,
    required String emptyError,
    required String invalidError,
    required String insufficientFundsError,
  }) {
    if (value == null || value.trim().isEmpty) {
      return emptyError;
    }

    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return invalidError;
    }

    if (maxAmount != null && amount > maxAmount) {
      return insufficientFundsError;
    }

    return null;
  }

  static bool _isZeroValue(String text) {
    if (text.isEmpty) return false;

    final parsed = double.tryParse(text.replaceAll(',', '.'));
    return parsed != null && parsed == 0.0;
  }

  static String _removeTrailingSeparators(String text) {
    if (text.endsWith('.') || text.endsWith(',')) {
      return text.substring(0, text.length - 1);
    }
    return text;
  }

  static String _formatNumber(String text) {
    try {
      return double.parse(text).toString();
    } catch (e) {
      return text;
    }
  }

  static void _handleFocusGained(TextEditingController controller) {
    final text = controller.text;

    if (_isZeroValue(text)) {
      controller.text = '';
    }
  }

  static void _handleFocusLost(
    TextEditingController controller,
    String separator,
  ) {
    var text = controller.text;

    if (text.isEmpty) {
      controller.text = '0${separator}0';
      return;
    }

    final isComma = text.contains(',');
    text = text.replaceAll(',', '.');

    if (text.endsWith('.')) {
      text = text.substring(0, text.length - 1);
      controller.text = text;
      return;
    }

    try {
      text = double.parse(text).toString();

      if (double.parse(text) == double.parse(text).toInt()) {
        text = double.parse(text).toInt().toString();
      }

      if (isComma) {
        text = text.replaceAll('.', separator);
      }

      controller.text = text;

      if (_isZeroValue(controller.text)) {
        controller.text = '0${separator}0';
      }
    } catch (e) {}
  }
}

typedef AmountErrorCallback = void Function();
typedef AmountValidationCallback = String? Function(String? value);
