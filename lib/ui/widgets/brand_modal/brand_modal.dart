import 'package:flutter/material.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';

class BrandModal {
  static Future<T?> showAnimatedDialog<T>({
    required BuildContext context,
    required bool barrierDismissible,
    required Widget child,
  }) {
    return showDialog<T>(
      barrierDismissible: barrierDismissible,
      context: context,
      // barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) => _Modal(child: child),
    );
  }
}

class _Modal extends StatefulWidget {
  const _Modal({required this.child});

  final Widget child;

  @override
  State<_Modal> createState() => _ModalState();
}

class _ModalState extends State<_Modal> {
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isStarted = true;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 1300), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isStarted ? 0 : 1,
      duration: Duration(milliseconds: 300),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: BrandColors.dark,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(25),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
