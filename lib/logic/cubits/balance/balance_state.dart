part of 'balance_cubit.dart';

sealed class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object> get props => [];
}

final class BalanceInitial extends BalanceState {}

final class BalanceLoaded extends BalanceState {
  final BalanceModel balance;

  const BalanceLoaded(this.balance);

  @override
  List<Object> get props => [balance];
}
