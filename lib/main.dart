import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: PresentlyApp()));
}

class PresentlyApp extends StatelessWidget {
  const PresentlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Presently',
      debugShowCheckedModeBanner: false,

      // Apply Design System Theme
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system, // Follow system theme
      // Router Configuration
      routerConfig: AppRouter.router,
    );
  }
}
