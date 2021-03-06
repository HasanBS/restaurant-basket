import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;

  static LanguageManager get instance {
    return _instance ??= LanguageManager._init();
  }

  LanguageManager._init();

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');
  final deLoacale = const Locale('de', 'DE');

  List<Locale> get supportedLocales => [trLocale, enLocale, deLoacale];
}
