enum Language { en, de, tr }

extension LanguageEnumString on Language {
  String get stringValue {
    switch (this) {
      case Language.en:
        return 'en';
      case Language.de:
        return 'de';
      case Language.tr:
        return 'tr';
      default:
        throw Exception('Routes Not FouND');
    }
  }
}
