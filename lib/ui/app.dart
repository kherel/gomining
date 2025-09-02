import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomining_kherel/logic/cubits/wallet/wallet_cubit.dart';
import 'package:gomining_kherel/ui/pages/home/home.dart';
import 'package:gomining_kherel/ui/pages/splash/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final walletStatus = context.watch<WalletCubit>().state;

    if (walletStatus is WalletInitial) {
      return SplashScreen();
    } else if (walletStatus is WalletAuthenticated) {
      return HomeScreen();
    } else {
      return const SizedBox.shrink();
    }
  }
}
