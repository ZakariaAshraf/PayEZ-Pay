import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = NotifierProvider<LocaleNotifier, Locale?>(() {
  return LocaleNotifier();
});

class LocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() {
    // return const Locale('en');
    return null;
  }

  void setLocale(Locale newLocale) {
    if (state != newLocale) {
      state = newLocale;
    }
  }

  void toggleLocale() {
    state = state?.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
  }

  bool get isEnglish => state?.languageCode == 'en';
  bool get isArabic => state?.languageCode == 'ar';
  bool get isSystem => state == null;
}