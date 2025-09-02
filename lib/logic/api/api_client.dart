import 'dart:async';

import 'package:dio/dio.dart';

abstract class ApiService {
  late Dio client;

  Future<Dio> initClient() async {
    final client = Dio(await options);

    return client;
  }

  FutureOr<BaseOptions> get options;
}
