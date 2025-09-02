import 'package:equatable/equatable.dart';
import 'package:gomining_kherel/logic/api/block_stream.dart';
import 'package:gomining_kherel/logic/cubits/base/dependent_cubit.dart';
import 'package:gomining_kherel/logic/cubits/wallet/wallet_cubit.dart';
import 'package:gomining_kherel/logic/models/transaction.dart';

part 'history_state.dart';

class HistoryCubit
    extends
        DependentCubit<
          WalletCubit,
          WalletAuthenticated,
          WalletInitial,
          HistoryState
        > {
  HistoryCubit(WalletCubit walletCubit) : super(walletCubit, HistoryInitial());

  final api = BlockStreamApi();

  Future<void> getHistory(String address) async {
    final history = await api.getHistory(address);
    emit(HistoryLoaded(history));
  }

  @override
  void load() {
    final address = (targetCubit.state as WalletAuthenticated).address;
    getHistory(address);
  }

  void send(double amount, String address) {
    final transactions = (state as HistoryLoaded).transactions;

    final newTransaction = TransactionModel(
      txid: 'fake_txid',
      confirmed: false,
      amountSatoshi: (amount * 100000000).toInt(),
      isIncoming: false,
      blockTime: DateTime.now(),
    );
    emit(HistoryLoaded([newTransaction, ...transactions]));
  }
}
