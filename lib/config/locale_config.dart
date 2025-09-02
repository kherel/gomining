// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gomining_kherel/config/translations.g.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> setLocale() async {
  await LocaleSettings.useDeviceLocale();

  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

  Intl.defaultLocale = deviceLocale.toString();
  await initializeDateFormatting();
}
