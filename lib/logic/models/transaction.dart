class TransactionModel {
  final String txid;
  final bool confirmed;
  final DateTime? blockTime;
  final int amountSatoshi; // в сатоши
  final bool isIncoming;

  TransactionModel({
    required this.txid,
    required this.confirmed,
    required this.amountSatoshi,
    required this.isIncoming,
    this.blockTime,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json, String address) {
    // проверяем статус
    final confirmed = json['status']['confirmed'] as bool;
    DateTime? blockTime;
    if (confirmed && json['status']['block_time'] != null) {
      blockTime = DateTime.fromMillisecondsSinceEpoch(
        (json['status']['block_time'] as int) * 1000,
      );
    }

    int valueOut = 0;
    for (var vout in json['vout']) {
      if (vout['scriptpubkey_address'] == address) {
        valueOut += vout['value'] as int;
      }
    }

    int valueIn = 0;
    for (var vin in json['vin']) {
      final prevout = vin['prevout'];
      if (prevout != null && prevout['scriptpubkey_address'] == address) {
        valueIn += prevout['value'] as int;
      }
    }

    final netAmount = valueOut - valueIn;
    final isIncoming = netAmount > 0;

    return TransactionModel(
      txid: json['txid'],
      confirmed: confirmed,
      blockTime: blockTime,
      amountSatoshi: netAmount.abs(),
      isIncoming: isIncoming,
    );
  }

  double get amountBtc => amountSatoshi / 100000000;
}
