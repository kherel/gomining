import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gomining_kherel/logic/get_it/navigation_service.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() async {
  getIt.registerSingleton<NavigationService>(NavigationService());

  await getIt.allReady();
}

class Get {
  static BuildContext? get context =>
      getIt.get<NavigationService>().navigatorKey.currentContext;
}

NavigationService get navigationService => getIt<NavigationService>();
