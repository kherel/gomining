import 'package:equatable/equatable.dart';
import 'package:gomining_kherel/logic/api/block_stream.dart';
import 'package:gomining_kherel/logic/cubits/base/dependent_cubit.dart';
import 'package:gomining_kherel/logic/cubits/wallet/wallet_cubit.dart';
import 'package:gomining_kherel/logic/models/balance.dart';

part 'balance_state.dart';

class BalanceCubit
    extends
        DependentCubit<
          WalletCubit,
          WalletAuthenticated,
          WalletInitial,
          BalanceState
        > {
  BalanceCubit(WalletCubit walletCubit) : super(walletCubit, BalanceInitial());

  final api = BlockStreamApi();

  Future<void> getBalance(String address) async {
    final balance = await api.getBalance(address);
    emit(BalanceLoaded(balance));
  }

  @override
  void load() {
    final address = (targetCubit.state as WalletAuthenticated).address;
    getBalance(address);
  }
}
