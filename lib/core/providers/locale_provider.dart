import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 언어 설정을 관리하는 Provider
///
/// SharedPreferences를 사용하여 사용자의 언어 선택을 저장하고 불러옵니다.
/// 기본 언어는 한국어(ko)입니다.
class LocaleNotifier extends StateNotifier<Locale> {
  static const String _localeKey = 'selected_locale';
  final SharedPreferences _prefs;

  LocaleNotifier(this._prefs) : super(const Locale('ko')) {
    _loadLocale();
  }

  /// SharedPreferences에서 저장된 언어 설정을 불러옵니다
  void _loadLocale() {
    final languageCode = _prefs.getString(_localeKey);
    if (languageCode != null) {
      state = Locale(languageCode);
    }
  }

  /// 언어를 변경하고 SharedPreferences에 저장합니다
  Future<void> setLocale(Locale locale) async {
    state = locale;
    await _prefs.setString(_localeKey, locale.languageCode);
  }

  /// 한국어로 변경
  Future<void> setKorean() async {
    await setLocale(const Locale('ko'));
  }

  /// 영어로 변경
  Future<void> setEnglish() async {
    await setLocale(const Locale('en'));
  }
}

/// SharedPreferences 인스턴스를 제공하는 Provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized in main()');
});

/// 현재 선택된 언어를 제공하는 Provider
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return LocaleNotifier(prefs);
});
