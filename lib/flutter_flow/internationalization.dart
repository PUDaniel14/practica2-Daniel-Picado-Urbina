import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '2u7rqapc': {
      'es': 'Navegación',
      'en': 'Navigation',
    },
    '7kqqspoq': {
      'es': 'Ir a la siguiente pantalla',
      'en': 'Go to next screen',
    },
    '8h0vd5or': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // page2
  {
    'h6n4vn7v': {
      'es': 'Segunda página',
      'en': 'Second page',
    },
    '12polpyw': {
      'es': 'Volver a la página principal',
      'en': 'Back to main page',
    },
    'c14a67iq': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    't6tmjp4x': {
      'es': 'I need the bluetooth service.',
      'en': '',
    },
    '0lskh321': {
      'es': '',
      'en': '',
    },
    'szboze4f': {
      'es': '',
      'en': '',
    },
    'xkwfvdnz': {
      'es': '',
      'en': '',
    },
    '96p08h00': {
      'es': '',
      'en': '',
    },
    'fsx22xcx': {
      'es': '',
      'en': '',
    },
    's1qs5ilw': {
      'es': '',
      'en': '',
    },
    '1nycqoc2': {
      'es': '',
      'en': '',
    },
    'dwyqcqw6': {
      'es': '',
      'en': '',
    },
    'svhf69bs': {
      'es': '',
      'en': '',
    },
    '5zsni2bj': {
      'es': '',
      'en': '',
    },
    'q7q0xgxq': {
      'es': '',
      'en': '',
    },
    'rstzzmyn': {
      'es': '',
      'en': '',
    },
    'od6whct8': {
      'es': '',
      'en': '',
    },
    'l46tezdi': {
      'es': '',
      'en': '',
    },
    'dhrtg76g': {
      'es': '',
      'en': '',
    },
    'jf9htv1k': {
      'es': '',
      'en': '',
    },
    'q5p94rm2': {
      'es': '',
      'en': '',
    },
    'q5z7z06o': {
      'es': '',
      'en': '',
    },
    'z270ncvw': {
      'es': '',
      'en': '',
    },
    'iod05jvc': {
      'es': '',
      'en': '',
    },
    'qewgc616': {
      'es': '',
      'en': '',
    },
    'gnsp312k': {
      'es': '',
      'en': '',
    },
    '6r1msycq': {
      'es': '',
      'en': '',
    },
    'e6roqgop': {
      'es': '',
      'en': '',
    },
    'jrexjjzy': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
