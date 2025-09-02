import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gomining_kherel/config/get_it_config.dart';
import 'package:gomining_kherel/config/locale_config.dart';
import 'package:gomining_kherel/config/root_bloc_provider.dart';
import 'package:gomining_kherel/config/translations.g.dart';
import 'package:gomining_kherel/logic/get_it/navigation_service.dart';
import 'package:gomining_kherel/ui/app.dart';
import 'package:gomining_kherel/ui/widgets/brand_system_overlay/brand_system_overlay.dart';

void main() {
  getItSetup();
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setLocale();
    });

    return RootBlocProvider(
      child: BrandSystemOverlay(
        isFontBlack: false,
        child: MaterialApp(
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
          navigatorKey: getIt<NavigationService>().navigatorKey,
          title: t.app.title,
          home: const App(),
        ),
      ),
    );
  }
}
