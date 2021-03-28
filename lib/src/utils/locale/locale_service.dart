import 'package:flutter/material.dart';
import 'package:flutterarchitecture/src/utils/locale/locale/en_US.dart';
import 'package:flutterarchitecture/src/utils/locale/locale/vi_VN.dart';

/// [LocaleService] class locale service of app
class LocaleService {
  /// [localeDefault] this's default locale if don't have locale are matches
  static const Locale localeDefault = Locale('en', 'US');

  /// [locales] list of all the locale of app
  static List<Locale> locales = [Locale('vi', 'VN'), Locale('en', 'US')];

  /// [langs] this's file language of app
  static Map<String, Map<String, String>> langs = {
    'vi-VN': viVN,
    'en-US': enUS,
  };

  /// name of language for app
  static Map<String, String> languagues = {
    'vi-VN': 'Việt Nam',
    'en-US': 'English',
  };

  /// [getLocale] get Locale from countryCode
  static Locale getLocale(String countryCode) {
    final _locale = LocaleService.locales.firstWhere((e) {
      return e.countryCode == countryCode;
    }, orElse: () => LocaleService.localeDefault);

    return _locale;
  }
}
