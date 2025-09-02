part of 'wallet_cubit.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}

final class WalletAuthenticated extends WalletState {
  final String address;

  const WalletAuthenticated(this.address);

  @override
  List<Object> get props => [address];
}
