import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

Future<Locale> setLocale(String languageCode) async {
  await box.write('language', languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  final String languageCode = box.read('language') ?? 'en';
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : const Locale('en', '');
}
