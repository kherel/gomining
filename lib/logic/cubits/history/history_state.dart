part of 'history_cubit.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {}

final class HistoryLoaded extends HistoryState {
  final List<TransactionModel> transactions;

  const HistoryLoaded(this.transactions);



  @override
  List<Object> get props => [transactions];
}
