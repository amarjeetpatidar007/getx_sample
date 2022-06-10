import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  static final langs = [
    'English',
    '日本',
    '한국어',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ja', 'JP'),
    const Locale('ko', 'KR'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'msg': 'Hello', 'select': 'Select Language'},
        'ja_JP': {'msg': 'こんにちは', 'select': '言語を選択する'},
        'ko_KR': {'msg': '안녕하세요', 'select': '언어 선택'},
      };

  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  static Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
