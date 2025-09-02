import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomining_kherel/logic/cubits/balance/balance_cubit.dart';
import 'package:gomining_kherel/ui/theme/brand_typo.dart';

class HomeAppBar extends SliverPersistentHeaderDelegate {
  const HomeAppBar({required this.safeAreaTop});

  final double safeAreaTop;

  @override
  double get minExtent => 60 + safeAreaTop;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final delta = maxExtent - minExtent;
    final opacityAnimationValue = ((delta - shrinkOffset) / delta).clamp(
      0.0,
      1.0,
    );

    // Анимация размера текста
    final titleScale = 1.0 - (shrinkOffset / delta * 0.3).clamp(0.0, 0.3);
    final amountScale = 1.0 - (shrinkOffset / delta * 0.2).clamp(0.0, 0.2);

    final balance = context.watch<BalanceCubit>().state;
    if (balance is! BalanceLoaded) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 1 - opacityAnimationValue,
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: opacityAnimationValue,
                child: Text(
                  'Total Amount',
                  style: ThemeTypo.tinyRegular.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14 * titleScale,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Сумма в BTC
              Text(
                '${balance.balance.confirmedBtc} BTC',
                style: ThemeTypo.heading2RegularWeak.copyWith(
                  color: Colors.white,
                  fontSize: 32 * amountScale,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double get maxExtent => 100 + safeAreaTop;
}
