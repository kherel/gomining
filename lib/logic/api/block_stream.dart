import 'dart:async';

import 'package:gomining_kherel/config/api_config.dart';
import 'package:gomining_kherel/logic/api/block_stream.dart';
import 'package:gomining_kherel/logic/api/api_client.dart';
import 'package:gomining_kherel/logic/models/balance.dart';
import 'package:gomining_kherel/logic/models/transaction.dart';

export 'package:dio/dio.dart';

class BlockStreamApi extends ApiService {
  BlockStreamApi();

  @override
  FutureOr<BaseOptions> get options =>
      BaseOptions(baseUrl: blockChainStreamUrl);

  Future<List<TransactionModel>> getHistory(String address) async {
    final client = await initClient();
    final response = await client.get('/testnet/api/address/$address/txs');
    return response.data
        .map((e) => TransactionModel.fromJson(e, address))
        .cast<TransactionModel>()
        .toList();
  }

  Future<BalanceModel> getBalance(String address) async {
    final client = await initClient();
    final response = await client.get('/testnet/api/address/$address');
    return BalanceModel.fromJson(response.data);
  }
}
