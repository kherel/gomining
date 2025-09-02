class BalanceModel {
  final int confirmed;
  final int unconfirmed;

  BalanceModel({required this.confirmed, required this.unconfirmed});

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    final chain = json['chain_stats'];
    final mempool = json['mempool_stats'];

    final confirmedBalance =
        (chain['funded_txo_sum'] as int) - (chain['spent_txo_sum'] as int);

    final unconfirmedBalance =
        (mempool['funded_txo_sum'] as int) - (mempool['spent_txo_sum'] as int);

    return BalanceModel(
      confirmed: confirmedBalance,
      unconfirmed: unconfirmedBalance,
    );
  }

  int get totalSatoshi => confirmed + unconfirmed;

  double get confirmedBtc => confirmed / 100000000;

  double get unconfirmedBtc => unconfirmed / 100000000;

  double get totalBtc => totalSatoshi / 100000000;
}
