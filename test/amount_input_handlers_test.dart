import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomining_kherel/ui/utils/amount_input_handlers.dart';

void main() {
  group('AmountInputHandlers Tests', () {
    late TextEditingController controller;
    late FocusNode focusNode;

    setUp(() {
      controller = TextEditingController();
      focusNode = FocusNode();
    });

    tearDown(() {
      controller.dispose();
      focusNode.dispose();
    });

    group('onTextChanged Tests', () {
      test('should format text and trigger error callback when provided', () {
        bool callbackCalled = false;

        AmountInputHandlers.onTextChanged(
          controller: controller,
          value: '1,5',
          maxDecimals: 8,
          onErrorChanged: () => callbackCalled = true,
        );

        expect(controller.text, '1,5');
        expect(callbackCalled, true);
      });

      test('should not trigger callback when not provided', () {
        AmountInputHandlers.onTextChanged(
          controller: controller,
          value: '1,5',
          maxDecimals: 8,
          onErrorChanged: null,
        );

        expect(controller.text, '1,5');
      });

      test('should limit decimal places correctly', () {
        AmountInputHandlers.onTextChanged(
          controller: controller,
          value: '1.123456789',
          maxDecimals: 3,
          onErrorChanged: null,
        );

        expect(controller.text, '1.123');
      });

      test('should clear zero values', () {
        AmountInputHandlers.onTextChanged(
          controller: controller,
          value: '0',
          maxDecimals: 8,
          onErrorChanged: null,
        );

        expect(controller.text, '');
      });

      test('should clear zero with decimals', () {
        AmountInputHandlers.onTextChanged(
          controller: controller,
          value: '0.0000',
          maxDecimals: 8,
          onErrorChanged: null,
        );

        expect(controller.text, '');
      });

      test('should clear zero with comma', () {
        AmountInputHandlers.onTextChanged(
          controller: controller,
          value: '0,0',
          maxDecimals: 8,
          onErrorChanged: null,
        );

        expect(controller.text, '');
      });
    });

    group('onTap Tests', () {
      test('should clear zero values on tap', () {
        controller.text = '0';
        AmountInputHandlers.onTap(controller: controller);
        expect(controller.text, '');
      });

      test('should clear 0.0 on tap', () {
        controller.text = '0.0';
        AmountInputHandlers.onTap(controller: controller);
        expect(controller.text, '');
      });

      test('should clear 0,0 on tap', () {
        controller.text = '0,0';
        AmountInputHandlers.onTap(controller: controller);
        expect(controller.text, '');
      });

      test('should not clear non-zero values on tap', () {
        controller.text = '1.5';
        AmountInputHandlers.onTap(controller: controller);
        expect(controller.text, '1.5');
      });
    });

    group('onEditingComplete Tests', () {
      test('should set 0.0 for empty text', () {
        controller.text = '';
        AmountInputHandlers.onEditingComplete(
          controller: controller,
          focusNode: focusNode,
        );
        expect(controller.text, '0.0');
      });

      test('should remove trailing dot', () {
        controller.text = '1.';
        AmountInputHandlers.onEditingComplete(
          controller: controller,
          focusNode: focusNode,
        );
        expect(controller.text, '1.0');
      });

      test('should remove trailing comma', () {
        controller.text = '1,';
        AmountInputHandlers.onEditingComplete(
          controller: controller,
          focusNode: focusNode,
        );
        expect(controller.text, '1.0');
      });

      test('should format valid numbers', () {
        controller.text = '1.500';
        AmountInputHandlers.onEditingComplete(
          controller: controller,
          focusNode: focusNode,
        );
        expect(controller.text, '1.5');
      });

      test('should handle integer values', () {
        controller.text = '5';
        AmountInputHandlers.onEditingComplete(
          controller: controller,
          focusNode: focusNode,
        );
        expect(controller.text, '5.0');
      });
    });

    group('onFocusChange Tests', () {
      test('should clear zero values when gaining focus', () {
        controller.text = '0';
        AmountInputHandlers.onFocusChange(
          controller: controller,
          hasFocus: true,
          separator: '.',
        );
        expect(controller.text, '');
      });

      test('should set 0.0 for empty text when losing focus', () {
        controller.text = '';
        AmountInputHandlers.onFocusChange(
          controller: controller,
          hasFocus: false,
          separator: '.',
        );
        expect(controller.text, '0.0');
      });

      test('should format number when losing focus', () {
        controller.text = '1.500';
        AmountInputHandlers.onFocusChange(
          controller: controller,
          hasFocus: false,
          separator: '.',
        );
        expect(controller.text, '1.5');
      });

      test('should handle comma separator when losing focus', () {
        controller.text = '1,500';
        AmountInputHandlers.onFocusChange(
          controller: controller,
          hasFocus: false,
          separator: ',',
        );
        expect(controller.text, '1,5');
      });
    });

    group('validateAmount Tests', () {
      test('should return error for null value', () {
        final result = AmountInputHandlers.validateAmount(
          value: null,
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Empty');
      });

      test('should return error for empty string', () {
        final result = AmountInputHandlers.validateAmount(
          value: '',
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Empty');
      });

      test('should return error for invalid number', () {
        final result = AmountInputHandlers.validateAmount(
          value: 'abc',
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Invalid');
      });

      test('should return error for zero', () {
        final result = AmountInputHandlers.validateAmount(
          value: '0',
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Invalid');
      });

      test('should return error for negative number', () {
        final result = AmountInputHandlers.validateAmount(
          value: '-1.5',
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Invalid');
      });

      test('should return error for insufficient funds', () {
        final result = AmountInputHandlers.validateAmount(
          value: '15.0',
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Insufficient');
      });

      test('should return null for valid amount', () {
        final result = AmountInputHandlers.validateAmount(
          value: '5.0',
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, isNull);
      });

      test('should return null when maxAmount is null', () {
        final result = AmountInputHandlers.validateAmount(
          value: '5.0',
          maxAmount: null,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, isNull);
      });

      test('should handle amount equal to maxAmount', () {
        final result = AmountInputHandlers.validateAmount(
          value: '10.0',
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, isNull);
      });

      test('should handle very small amounts', () {
        final result = AmountInputHandlers.validateAmount(
          value: '0.00000001',
          maxAmount: 1.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, isNull);
      });

      test('should handle scientific notation', () {
        final result = AmountInputHandlers.validateAmount(
          value: '1e-8',
          maxAmount: 1.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, isNull);
      });
    });

    group('Edge Cases Tests', () {
      test('should handle whitespace in validation', () {
        final result = AmountInputHandlers.validateAmount(
          value: '   ',
          maxAmount: 10.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Empty');
      });

      test('should handle very large numbers', () {
        final result = AmountInputHandlers.validateAmount(
          value: '999999999.99999999',
          maxAmount: 1000000000.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, isNull);
      });

      test('should handle decimal precision correctly', () {
        final result = AmountInputHandlers.validateAmount(
          value: '0.12345678',
          maxAmount: 1.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, isNull);
      });

      test('should return error for zero with decimals', () {
        final result = AmountInputHandlers.validateAmount(
          value: '0.0000',
          maxAmount: 1.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Invalid');
      });

      test('should return error for zero with many decimals', () {
        final result = AmountInputHandlers.validateAmount(
          value: '0.00000000',
          maxAmount: 1.0,
          emptyError: 'Empty',
          invalidError: 'Invalid',
          insufficientFundsError: 'Insufficient',
        );
        expect(result, 'Invalid');
      });
    });
  });
}
