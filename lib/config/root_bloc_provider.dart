import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomining_kherel/logic/cubits/balance/balance_cubit.dart';
import 'package:gomining_kherel/logic/cubits/history/history_cubit.dart';
import 'package:gomining_kherel/logic/cubits/wallet/wallet_cubit.dart';

import 'package:provider/provider.dart';

final mokedAddres = 'tb1ql9eghhlyn3pd3z749ygzek0rgfz5a2kggy0tu6';

class RootBlocProvider extends StatelessWidget {
  const RootBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => WalletCubit()..authenticate(mokedAddres),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => BalanceCubit(context.read<WalletCubit>()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => HistoryCubit(context.read<WalletCubit>()),
          lazy: false,
        ),
      ],
      child: child,
    );
  }
}
