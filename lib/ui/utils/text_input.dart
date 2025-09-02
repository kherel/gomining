import 'dart:math' as math;

import 'package:flutter/material.dart';

void formatTextInputValue(
    TextEditingController controller, String value, int decimals) {
  final selection = controller.selection;
  final isComma = value.contains(',');

  value = value.replaceAll(',', '.');
  // Remove all non-numeric characters except dot
  final onlyNumbersAndDots = value.replaceAll(RegExp(r'[^0-9.]'), '');
  if (onlyNumbersAndDots != value) {
    controller.text = onlyNumbersAndDots;
    controller.selection = selection.copyWith(
      baseOffset: math.min(controller.text.length, selection.baseOffset),
      extentOffset: math.min(controller.text.length, selection.extentOffset),
    );
    return;
  }

  // Check if there are multiple dots
  if (value.indexOf('.') != value.lastIndexOf('.')) {
    value = value.substring(0, value.lastIndexOf('.'));
    if (isComma) {
      value = value.replaceAll('.', ',');
    }
    controller.text = value;
    controller.selection = selection.copyWith(
      baseOffset: math.min(controller.text.length, selection.baseOffset),
      extentOffset: math.min(controller.text.length, selection.extentOffset),
    );
    return;
  }

  // Ensuring single leading zero before decimal
  if (value.startsWith('.')) {
    if (isComma) {
      value = value.replaceAll('.', ',');
    }
    controller.text = '0$value';
    controller.selection = selection.copyWith(
      baseOffset: math.min(controller.text.length, selection.baseOffset + 1),
      extentOffset:
          math.min(controller.text.length, selection.extentOffset + 1),
    );
    return;
  }

  // Check if the number of decimals exceeds max
  if (value.contains('.') && value.split('.').last.length > decimals) {
    value = value.substring(0, value.indexOf('.') + decimals + 1);
    if (isComma) {
      value = value.replaceAll('.', ',');
    }
    controller.text = value;
    controller.selection = selection.copyWith(
      baseOffset: math.min(controller.text.length, selection.baseOffset),
      extentOffset: math.min(controller.text.length, selection.extentOffset),
    );
  }

  // Removing leading zeroes not followed by a dot
  final RegExp regexp = RegExp(r'^0+(?=\d)');
  final match = regexp.firstMatch(value);
  final matchLength = match?.group(0)?.length ?? 0;

  if (matchLength > 0) {
    controller.text = value.replaceAll(regexp, '');
    controller.selection = selection.copyWith(
      baseOffset: math.min(
        controller.text.length,
        selection.baseOffset - matchLength,
      ),
      extentOffset: math.min(
        controller.text.length,
        selection.extentOffset - matchLength,
      ),
    );
  }
}

void focusTextInputListener(
  TextEditingController controller,
  FocusNode focusNode,
  String separator,
) {
  if (focusNode.hasFocus) {
    if (controller.text == '0,0' ||
        controller.text == '0.0' ||
        controller.text == '0') {
      controller.text = '';
    }
  } else {
    var text = controller.text;
    if (text.isEmpty) {
      controller.text = '0${separator}0';
      return;
    }

    bool isComma = text.contains(',');

    text = text.replaceAll(',', '.');

    if (text.endsWith('.')) {
      text = text.substring(0, text.length - 1);
      controller.text = text;
      return;
    }

    text = double.parse(text).toString();

    if (double.parse(text) == double.parse(text).toInt()) {
      text = double.parse(text).toInt().toString();
    }

    if (isComma) {
      text = text.replaceAll('.', separator);
    }

    controller.text = text;

    if (controller.text == '0${separator}0' ||
        controller.text == '0$separator' ||
        controller.text == '0') {
      controller.text = '0${separator}0';
    }
  }
}
