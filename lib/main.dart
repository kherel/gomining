import 'package:flutter/material.dart';
import 'package:gomining_kherel/config/get_it_config.dart';
import 'package:gomining_kherel/config/root_bloc_provider.dart';
import 'package:gomining_kherel/logic/get_it/navigation_service.dart';
import 'package:gomining_kherel/ui/app.dart';
import 'package:gomining_kherel/ui/widgets/brand_system_overlay/brand_system_overlay.dart';

void main() {
  getItSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RootBlocProvider(
      child: BrandSystemOverlay(
        isFontBlack: false,
        child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
          navigatorKey: getIt<NavigationService>().navigatorKey,
          title: 'Gomining Wallet',
          home: const App(),
        ),
      ),
    );
  }
}
