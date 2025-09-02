import 'dart:math';
import 'package:flutter/material.dart';

class BrandBottomSheet extends StatelessWidget {
  const BrandBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Material(color: Colors.transparent, child: child),
          ),
          SizedBox(height: max(MediaQuery.of(context).padding.bottom, 10.0)),
        ],
      ),
    );
  }
}
