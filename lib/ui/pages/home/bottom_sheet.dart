import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomining_kherel/config/translations.g.dart';
import 'package:gomining_kherel/logic/cubits/history/history_cubit.dart';
import 'package:gomining_kherel/ui/overlays/receive/receive.dart';
import 'package:gomining_kherel/ui/overlays/send/send.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';
import 'package:gomining_kherel/ui/widgets/brand_buttons/brand_buttons.dart';
import 'package:gomining_kherel/ui/widgets/success_modal/success_modal.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: max(10, MediaQuery.of(context).padding.bottom),
        left: 16,
        right: 16,
        top: 16,
      ),

      decoration: BoxDecoration(
        color: BrandColors.dark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(top: BorderSide(color: BrandColors.brand200, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: BrandButtons.iconButton(
              onTap: () {
                ReceiveBottomSheet.show(context);
              },
              icon: Icons.arrow_downward,
              text: t.bottom_bar.receive,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: BrandButtons.iconButton(
              onTap: () async {
                final cubit = context.read<HistoryCubit>();
                final res = await SendBottomSheet.show(context);
                if (res != null && context.mounted) {
                  cubit.send(res.amount, res.address);
                  SuccessModal.show(context);
                }
              },
              icon: Icons.arrow_upward,
              text: t.bottom_bar.send,
            ),
          ),
        ],
      ),
    );
  }
}
