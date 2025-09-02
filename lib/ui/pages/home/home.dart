import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomining_kherel/logic/cubits/history/history_cubit.dart';
import 'package:gomining_kherel/ui/pages/home/bottom_sheet.dart';
import 'package:gomining_kherel/ui/pages/home/home_app_bar.dart';
import 'package:gomining_kherel/ui/theme/brand_theme.dart';
import 'package:gomining_kherel/ui/widgets/transaction_item/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyState = context.watch<HistoryCubit>().state;
    if (historyState is! HistoryLoaded) {
      return const SizedBox.shrink();
    }
    return DecoratedBox(
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: HomeAppBar(
                      safeAreaTop: MediaQuery.of(context).padding.top,
                    ),
                  ),
                  CupertinoSliverRefreshControl(
                    onRefresh: () async {
                      context.read<HistoryCubit>().load();
                      await Future.delayed(const Duration(seconds: 2));
                    },
                  ),
                  SliverList.separated(
                    itemCount: historyState.transactions.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return TransactionItem(
                        transaction: historyState.transactions[index],
                      );
                    },
                  ),
                ],
              ),
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
