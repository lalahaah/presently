import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/providers/locale_provider.dart';
import 'package:presently/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 초기화
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // SharedPreferences 초기화
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // SharedPreferences Provider 오버라이드
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const PresentlyApp(),
    ),
  );
}

class PresentlyApp extends ConsumerWidget {
  const PresentlyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 선택된 언어를 감시
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Presently',
      debugShowCheckedModeBanner: false,

      // Localization 설정
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko'), // 한국어 (기본)
        Locale('en'), // 영어
      ],
      locale: locale, // Provider에서 관리하는 현재 언어
      // 지원하지 않는 언어일 경우 한국어로 폴백
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (deviceLocale == null) {
          return const Locale('ko');
        }

        // 디바이스 언어가 지원 언어 목록에 있는지 확인
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode) {
            return locale;
          }
        }

        // 지원하지 않는 언어면 한국어로 폴백
        return const Locale('ko');
      },

      // Apply Design System Theme
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system, // Follow system theme
      // Router Configuration
      routerConfig: AppRouter.router,
    );
  }
}
